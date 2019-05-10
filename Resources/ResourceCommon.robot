Documentation       Acesso ao ME com login valido

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${DELAY}        10 seconds
${USERNAME}     anadson_silva
${PASSWORD}     An@dson1031
${LOGIN URL}        https://carrefourhomo.multiembarcador.com.br/Login
${HOME URL}     https://carrefourhomo.multiembarcador.com.br/#Home

*** Keywords ***
Open Browser To Login valid
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${DELAY}
    Page Should Contain     Acesso ao Sistema
    Input Text    //*[@id="login-form"]/fieldset/section[1]/label[2]/input    ${USERNAME}
    Input Text    //*[@id="login-form"]/fieldset/section[2]/label[2]/input    ${PASSWORD}
    Click Button    //*[@id="login-form"]/footer/button
    Location Should Be    ${HOME URL}
    Title Should Be    Home
Fechar Navegador
    Close Browser
