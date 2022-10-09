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

--definindo uma variavel para os argumentos passados pelo jogador
atributo = arg[1]
segundo = arg[2]
--definindo variaveis importantes para o futuro
resultadosNumero = {}

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
    --definindo uma função importante para essa parte
    function valorNaTabela(value, array)
        --verifica se existe o valor passado no array passado
        for indice,valor in pairs(array) do
            if valor == value then
                --se o valor existir ele vai arrendondar o valor
                valor = math.floor(valor)
                --vai definir o valor arrendondado para a mesma posição que ele estava antes num array diferente
                resultadosNumero[indice] = valor
                -- vai fazer a mesma coisa aqui so que passado em string ao inves do valor
                resultados[indice] = tostring(valor)
                --retorna a posição e o valor
                return indice, valor
            end
        end
    end
    --definindo pequenas variaveis para usar nessa parte
    acd = 0
    acerto = 0
    cd = 8
    dados = {}
    resultados = {}
    algo = {}
    falha = 0
    res = ""
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
    local resultado, rolagem = rolarLocal(quantia .. "d10");
    --AQUI ELE TA VERIFICANDO RESULTADOS INDIVIDUAIS DOS DADOS (copiado do firecast memo)
    for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];
        if op.tipo == "dado" then
            for j = 1, #op.resultados, 1 do
                resultados[j] = op.resultados[j];
                dados[#dados + 1] = op.resultados[j];
            end;
        end;
    end;
    table.sort(dados)
    --verifica a macro vai verificar os resultados ordenados de cima pra baixo
    for j=#dados, 1, -1 do
        dados[j] = math.floor(dados[j])
        
        if dados[j] >= cd then
            --explicação abaixo
            acerto = acerto + 1
            local i = valorNaTabela(dados[j], resultados)
            algo[i] = "[§K3]"..resultados[i]
        elseif dados[j] == 1 then
            --aqui a macro vai fazer coisas parecidas para todas as partes, vou explicar apenas no começo
            --caso seja 1 ela vai retirar 1 em acerto
            acerto = acerto - 1
            --vai rodar a função recebendo a posição
            local i = valorNaTabela(dados[j], resultados)
            --vai definir a cor dela no array algo(tava puto) para dependendo do resultado e vai colocar na mesma posição
            algo[i] = "[§K4]"..resultados[i]
            --parte diferente em caso de falha
            --vai pegar a posição e valor o numero mais algo na tabela
            local im, vm = valorNaTabela(dados[#dados], resultadosNumero)
            --vai verificar se ele passa no cd
            if vm >= cd then
                --se passar ele vai riscar ele e mudar a cor para amarelo
                algo[im] = "[§K8][§s]"..resultados[im].."[§s][§R]"
            elseif vm == 1 then
                --se for 1 ele vai riscar e transformar em vermelho
                algo[im] = "[§K4][§s]"..resultados[im].."[§s][§R]"
            else
                --se não passar em nenhum dos dois acima então ele só vai definir a cor para cinza
                algo[im] = "[§K14]"..resultados[im]
            end
        else
            --explicação acima
            local i,v = valorNaTabela(dados[j],resultados)
            algo[i] = "[§K14]"..resultados[i].."[§R]"
        end
    end
    
        --verificar todos os valores definidos em algo
        for i=1,#algo do
            --se for o primeiro resultado, não faz nada apenas adiciona a res(uma string vazia)
            if i == 1 then
                res = res..algo[i]
            else
                --se não ele vai adicionar virgula antes 
                res = res.."[§R][§K14], "..algo[i]
            end
        end

        --terminando de tratar os resultados da forma mais parecida com o firecast
        resultadosTratados = "[§K1]{[§K14]("..res.."[§K14])[§K1]}"
    
        --AQUI EU TO ENVIANDO O RESULTADO DE FORMA publica, SÓ ALTERAR "enviar" PARA "escrever" QUE OS RESULTADOS SERÃO privados
        --se tiver 1 acerto ele vai enviar 1 sucesso
        if acerto == 1 then
            enviar('🎲 [§K2]'..meuJogador.nick ..'[§R][§K1] rolou [§K2]' .. quantia .. 'd10>'.. cd ..' [§K1]= [§K3]'..acerto..' Sucesso [§K1]'.. resultadosTratados ..'[§K1]');
        --se não tiver acertos ele vai enviar falha
        elseif acerto == 0 then
            enviar('🎲 [§K2]'..meuJogador.nick ..'[§R][§K1] rolou [§K2]' .. quantia .. 'd10>'.. cd ..' [§K1]= [§K7]Falha [§K1]'.. resultadosTratados ..'[§K1]');
        --se tiver menos de 0 acertos ele vai enviar falha critica
        elseif acerto <= -1 then
            enviar('🎲 [§K2]'..meuJogador.nick ..'[§R][§K1] rolou [§K2]' .. quantia .. 'd10>'.. cd ..' [§K1]= [§K4]Falha Critica [§K1]'.. resultadosTratados ..'[§K1]');
        --se tiver 2 ou mais acertos ele vai enviar 2 ou mais sucessos
        else
            enviar('🎲 [§K2]'..meuJogador.nick ..'[§R][§K1] rolou [§K2]' .. quantia .. 'd10>'.. cd ..' [§K1]= [§K3]'..acerto..' Sucessos [§K1]'.. resultadosTratados ..'[§K1]');
        end
end
--ACABOU :)
--MADE BY: Krampus