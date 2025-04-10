*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    OperatingSystem

*** Variables ***
${BROWSER}              chrome 
${URL}                  https://www.amazon.com.br
${MENU_ELETRONICOS}     //a[text()="Eletrônicos"]
${HEADER_ELETRONICOS}   //div/span[text()="Eletrônicos e Tecnologia"]
${TITLE_ELETRONICOS}    //title[text()="Eletrônicos e Tecnologia | Amazon.com.br"]
${NOME_CATEGORIA}       //a/span[text()="Computadores e Informática"]


*** Keywords ***
Abrir o navegador
    [Tags]    no_browser_close
    ${ci}=    Get Environment Variable    CI    default=False
    Run Keyword If    '${ci}'=='true'    Abrir navegador no modo CI
    ...    ELSE    Abrir navegador normalmente

Abrir navegador no modo CI
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${RANDOM}=     Evaluate    random.randint(1000, 9999)    random
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --user-data-dir=/tmp/profile_${RANDOM}
    Open Browser    ${URL}    chrome    options=${options}
    Maximize Browser Window


Abrir navegador normalmente
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

# Fechar o navegador
#     Capture Page Screenshot
#     Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITLE_ELETRONICOS}"
    Title Should Be    title=${TITLE_ELETRONICOS}
    
Digitar o nome de produto "Console Xbox Series" no campo de pesquisa
    Wait Until Element Is Visible    locator=field-keywords
    Input Text    locator=field-keywords    text=Console Xbox Series
     
Clicar no botão de pesquisa 
    Click Element    locator=nav-search-submit-button

Verificar se o resultado da pesquisa está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[5]

#-----------------------------GHERKIN STEPS------------------------------------------

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

Quando pesquisar pelo produto "Console Xbox Series"
    Digitar o nome de produto "Console Xbox Series" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Console Xbox Series"
    Verificar se o título da página fica "Amazon.com.br : Console Xbox Series"

E um produto da linha "Console Xbox Series S" deve ser mostrado na página    
    Verificar se o resultado da pesquisa está listando o produto "Console Xbox Series"
