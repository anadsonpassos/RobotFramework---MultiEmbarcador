Documentation       Consulta de carga existente valida - Menu de Cargas.

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${NumeroCarga}      3224

*** Keywords ***
###Setup e Teardown
# Abrir Navegador
#     Open Browser    ${URL}      ${Browser}
#     Set Window Size     1366    768
#     Set Selenium Timeout        15 seconds
    
# Fechar Navegador
#      Close Browser

###CENARIO 1
# Dado que eu estou na tela de login do sistema
#     Page Should Contain     Acesso ao Sistema
    
# Quando o usuario logar com login e senha validos
#     Input Text      //*[@id="login-form"]/fieldset/section[1]/label[2]/input    anadson_silva
#     Input Text      //*[@id="login-form"]/fieldset/section[2]/label[2]/input    An@dson1031 
#     Click Button        //*[@id="login-form"]/footer/button
#     Capture Page Screenshot     Logado_na_tela_HOME.png

# Entao a pagina home deve ser mostrada
#     Title Should Be     Home

###CENARIO 2
DADO que estou na tela de Cargas
    Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[2]/a/span
    Click Element     //*[@id="ulMenuSistema"]/li[2]/a/span

QUANDO eu solicitar acesso as cargas existentes sub-menu Cargas
    Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[2]/ul/li[1]/a
    Click Element     //*[@id="ulMenuSistema"]/li[2]/ul/li[1]/a

ENTAO a tela com a listagem das cargas deve ser exibida
    Title Should Be     Cargas

###CENARIO 3
DADO que estou na tela de pesquisa por filtros
    Wait Until Element is Visible       //*[@id="knotPesquisa"]/section/button[1]       
    Click Element        //*[@id="knotPesquisa"]/section/button[1]
    Page Should Contain     Nº da Carga:
    Page Should Contain     Filial:

QUANDO eu pesquisar a carga existente com os parametros "CargaNumero" ${NumeroCarga} e "filial"
    Wait Until Element is Visible       //input[contains(@data-bind,'CodigoCargaEmbarcador.id')]
    Input Text      //input[contains(@data-bind,'CodigoCargaEmbarcador.id')]     ${NumeroCarga}
    wait Until Element is Visible       //button[contains(@data-bind,'Filial.idBtnSearch')]
    Click Element       //button[contains(@data-bind,'Filial.idBtnSearch')] 
    Set Focus To Element        //*[contains(text(),'Buscar Filiais')]
    Wait Until Element is Visible       //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
    Click Element       //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
    Capture Element Screenshot      //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
    Wait Until Element is Visible       //*[@id="11"]/td[5] 
    Click Element      //*[@id="11"]/td[5]
    #Wait Until Element is Visible       //footer//button[contains(@class,'btn btn-default btn-primary btnPesquisarFiltroPesquisa')]
    #Click Element        //footer//button[contains(@class,'btn btn-default btn-primary btnPesquisarFiltroPesquisa')]
    
ENTAO a carga existente deve ser mostrada
    ${TEXTO}    Get Element Attribute   //span[contains(@data-bind,'Descricao.val')]      innerHTML
Log 		${TEXTO}
    Should Contain      ${TEXTO}    Carga ${NumeroCarga}

# E acionar o botao Cargas Novas
#     Wait Until Element is Visible        //*[@id="knotPesquisa"]/section/button[2]
#     Click Element       //*[@id="knotPesquisa"]/section/button[2]