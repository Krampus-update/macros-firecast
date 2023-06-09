local escolha = choose("O que deseja fazer?",
    {"Atributos", "Barras"});

if escolha == 1 then
    invoke("atributos")
elseif escolha == 2 then
    invoke("barras")
end