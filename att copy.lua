--/t forca mira ou /t forca 3
--PARA ADICIONAR/REMOVER ATRIBUTOS OU pericias MEXA NOS DOIS ABAIXO.
atributos = {
    "Forca",
    "Agilidade",
    "Destreza",
    "Constituicao",
    "Inteligencia",
    "Percepcao",
    "Carisma"
}
pericias = {
    "Mira",
    "Pilotagem",
    "Evasao",
    "Arremesso",
    "Desarmado",
    "Bloqueio",
    "Furtividade",
    "Acrobacia",
    "Corrida",
    "Escalada",
    "Medicina",
    "Analise",
    "Engenharia",
    "Mecanica",
    "Arrombamento",
    "Raciocinio",
    "Hacking",
    "Atuação",
    "Blefe",
    "Negociacao",
    "Intimidacao",
    "Manipulacao",
    "Empatia",
    "ApeloSexual"
}

--NADA PRA VER AQUI, CIRCULANDO...
acd = 0
atributo = arg[1]
segundo = arg[2]
acerto = 0
cd = 8

--SÓ PRA EVITAR PROBLEMAS
if arg[1] == nil then
    escrever("[§K1]Utilize:\n[§K4]*/t atributo pericia*[§K1] para rolar um teste\nou\n[§K4]*/t atributo/pericias valor*[§K1] para definir o valor do atributo")
    return
end
--PARTE 1
--AQUI A MACRO VERIFICA SE O TIPO DO SEGUNDO ARGUMENTO É UM NUMERO, E DEFINE O VALOR DO ATRIBUTO PARA O VALOR PASSADO
if type(tonumber(segundo)) == "number" then
    --COMO O SEGUNDO ARUMENTO FOI VERIFICADO COMO UM NUMERO, EU TRAVEI ELE COMO TAL
    segundo = tonumber(segundo)
    --VERIFICANDO CADA ATRIBUTO
    for i = 1, #atributos do
    --SE ELE LOCALIZAR EM ATRIBUTOS ELE VAI DEFINIR O VALOR DO ATRIBUTO
    if atributos[i] == atributo then
            toast("Atributo existe: " .. atributo .. "\nDefinindo para: " .. segundo)
            sheet.atributos[atributo] = segundo
        else
            for p = 1, #pericias do
                --SE NÃO ELE VAI TENTAR LOCALIZAR EM PERICIAS
                if pericias[p] == atributo then
                    toast("Atributo: " .. atributo .. "\nDefinindo para: " .. segundo)
                    sheet.pericias[atributo] = segundo
                end
            end
        end
    end
--PARTE 2
else
    --AQUI A MACRO VERIFICA CADA PERICIAS PARA VER SE O SEGUNDO ARGUMENTO É O MESMO VALOR
    for p = 1, #pericias do
        if pericias[p] == segundo then
            --SE FOR ELE VAI FAZER UM CALCULO DOIDO AI
            acd = sheet.pericias[segundo]
            cd = cd - acd
            quantia = sheet.atributos[atributo]
        end
    end
    --AQUI ELE FAZ A ROLAGEM COM O ATRIBUTO
    local resultado, rolagem = rolar(quantia .. "d10");
    --AQUI ELE TA VERIFICANDO RESULTADOS INDIVIDUAIS DOS DADOS (copiado do firecast memo)
    for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];
        if op.tipo == "dado" then
            for j = 1, #op.resultados, 1 do
                --SE O RESULTADO PASSAR NO CD ELE VAI ADICIONAR 1 ACERTO
                if op.resultados[j] >= cd then
                    acerto = acerto +1
                end
            end;
        end;
    end
    --AQUI EU TO ENVIANDO O RESULTADO DE FORMA ANONIMA, SÓ ALTERAR "escrever" PARA "enviar" QUE OS RESULTADOS SERÃO PUBLICOS
    escrever(acerto .. " dados passaram no CD de: " .. math.floor(cd))
end;
--ACABOU :)
--MADE BY: Krampus