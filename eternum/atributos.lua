local escolha = choose("O que deseja fazer?",
    {"Rolar Atributos", "Ver Atributos", "Modificar Atributos", "Definir Atributos (CUIDADO)"});

local atributo = {
    "Forca",
    "Destreza",
    "Constituicao",
    "Inteligencia",
    "Sabedoria",
    "Carisma"}

local a = "";
local valor = 0;



if escolha == 1 then
    local i, e = choose("Qual atributo?", atributo);
    local valor = sheet.atributos[e];
    valor = math.floor(valor/2-5);
    rolar("1d20+"..valor,"rolagem de "..e);
elseif escolha == 2 then
    if sheet.atributos ~= nil then
        for i = 1, #atributo, 1 do
            valor = sheet.atributos[atributo[i]];
            a = a .. atributo[i] .. ": " .. valor .. " | Mod: " .. math.floor(valor/2-5) .. "\n";
        end;
    end;
    showMessage(a)
elseif escolha == 3 then
    local ie, et = choose("Qual atributo?", atributo);
    valor = inputQuery("Qual o valor Atual?")
    sheet.atributos[et] = tonumber(valor)
elseif escolha == 4 then
    invoke("config");
else
    return
end
