*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${URL}      http://100.68.3.180/index.php
${NAVEGADOR}    chrome
${USER}     user_login
${PASSWORD}     user_pass
${BTLOGIN}      wp-submit
${nome}         fabio_queiroz
${senha}        1234
*** Keywords ***
Acessar Pagina Principal
    Open Browser    ${URL}  ${NAVEGADOR}
    Title Should Be    :: OTIMISY ::
Inserir login 
    Input Text    ${USER}   ${nome}     
Inserir senha
    Input Text    ${PASSWORD}    ${senha}
Fazer o login
    Click Button    ${BTLOGIN}
Validar pagina principal
    Page Should Contain    OTIMISY - HOME
    ##[Teardown]    Close Browser
Fechar o browser
   Close browser