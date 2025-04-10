*** Settings ***
Documentation        Essa suite testa o side da Amazon.com.Busca_produto.br
Resource             amazon_resources.robot
Test Setup           Abrir o navegador
# Test Teardown        Fechar o navegador
Force Tags           no_browser_close

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletronicos do site da Amazon.com.br 
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus  categorias   
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
      

Caso de teste 02 - Pesquisa de produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           Busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Console Xbox Series" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa está listando o produto "Console Xbox Series"
