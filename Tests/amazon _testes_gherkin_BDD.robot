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
    
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    

Caso de teste 02 - Pesquisa de produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           Busca_produtos  lista_busca
    
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Console Xbox Series"
    Então o título da página deve ficar "Amazon.com.br : Console Xbox Series"
    E um produto da linha "Console Xbox Series S" deve ser mostrado na página
