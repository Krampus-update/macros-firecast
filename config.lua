--ALTERE ESSAS TABELAS CASO QUEIRA ADICIONAR OU REMOVER ATRIBUTOS E PERICIAS
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
    "Atuacao",
    "Blefe",
    "Negociacao",
    "Intimidacao",
    "Manipulacao",
    "Empatia",
    "ApeloSexual"
}
--ABAIXO DAQUI NÃO TEM NECESSIDADES DE MODIFICAÇÃO SE NÃO SOUBER O QUE ESTÁ FAZENDO
--CASO QUEIRA USAR OS ATRIBUTOS E PERICIAS EM FICHA
--OS ATRIBUTOS ESTÃO ARRANJADOS DA SEGUINTE FORMA: SHEET.GRUPO.NOME
--SENDO ASSIM, FORÇA É SHEET.ATRIBUTOS.FORCA
--
--DEVIDO A PROBLEMAS DE """PREGUIÇA""" EU NÃO VOU TENTAR FAZER ACENTOS E ESPAÇOS FUNCIONAREM, TMJ
--MADE BY: Krampus
--
--OBS: ESSE COMENTARIO GIGANTE É PRA EVITAR QUEBRAS DE CODIGO, OU COISAS PARECIDAS, NÃO TEM UTILIDADE
--CASO SE SINTA INCOMODADO POR ISSO, FIQUE A VONTADE PARA TIRAR, MAS PELO MENOS DEIXA O CREDITO PRO PAI
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
sheet.atributos = {};
sheet.pericias = {};

--FOR LOOP DOS ATRIBUTOS
for a = 1, #atributos do
    sheet.atributos[atributos[a]] = tonumber(inputQuery("Qual o valor de " .. atributos[a] .. "?"))
end
--FOR LOOP DAS PERICIAS
for p = 1, #pericias do
    sheet.pericias[pericias[p]] = tonumber(inputQuery("Qual o valor de " .. pericias[p] .. "?"))
end
toast("Atributos Configurados\nComandos como \"/t\" agora devem funcionar corretamente")
--ACABOU :)
