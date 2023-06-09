local escolha = choose("O que deseja fazer?", {"Definir Recurso", "Calcula Barras"});

local atributo = {"Forca", "Destreza", "Constituicao", "Inteligencia", "Sabedoria", "Carisma"}

local jogador = meuJogador;

if escolha == 1 then
    sheet.recurso = choose("Qual o atributo", atributo)
    jogador:requestSetBarValue(2, 8+tonumber(math.floor(sheet.atributos[atributo[sheet.recurso]]) / 2 - 5), 8+tonumber(math.floor(sheet.atributos[atributo[sheet.recurso]]) / 2 - 5))
elseif escolha == 2 then
    -- vida
    jogador:requestSetBarValue(1, 8+tonumber(math.floor(sheet.atributos["Constituicao"]) / 2 - 5), 8+tonumber(math.floor(sheet.atributos["Constituicao"]) / 2 - 5))
    -- recurso
    jogador:requestSetBarValue(2, 8+tonumber(math.floor(sheet.atributos[atributo[sheet.recurso]]) / 2 - 5), 8+tonumber(math.floor(sheet.atributos[atributo[sheet.recurso]]) / 2 - 5))
    -- animo
    jogador:requestSetBarValue(3, 0, 5)
end
