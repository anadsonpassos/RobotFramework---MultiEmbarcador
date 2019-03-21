*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLPreCarga}      https://carrefourhomo.multiembarcador.com.br/#PreCargas/PreCarga

*** Keywords ***
###CENARIO 1
Dado que estou logado no sistema
    Title Should Be     Home

Quando eu acessar menu Gestao de Patio e sub-menu Pre Cargas
    Go To        ${URLPreCarga}   
    # Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[3]/a/span
    # Click Element     //*[@id="ulMenuSistema"]/li[3]/a/span
    # Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[3]/ul/li[3]/a
    # Click Element     //*[@id="ulMenuSistema"]/li[3]/ul/li[3]/a

Entao a tela de PreCargas deve ser mostrada
    Title Should Be     Pré Cargas

# ###CENARIO 2 
# Dado que estou na tela de PreCargas
#     Title Should Be     Pesquisar Pré Cargas
# Quando eu pesquisar PreCarga existentes com os parametros "DataInicial" 01/02/2019, "Remetente" CDA e "Filial" CDA
# Entao as PreCargas deve ser mostrada 

###CENARIO 2
Dado que estou na tela do Windows
    Wait Until Element Is Visible       //input[@value='Importar']     
    Sleep       10s
    Set Focus To Element        //input[@value='Importar']      
    Press Keys    //input[@value='Importar']    SPACE 
    Sleep    1s
    Capture Element Screenshot      //input[@value='Importar'] 

Quando eu importar o arquivo 
    Win Wait Active
    Control Focus       strTitle=Open     strText=${EMPTY}       strControl=Edit1
    Control Set Text        strTitle=Open       strText=${EMPTY}        strControl=Edit1        strControlText=C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao\\Teste.xlsx
    Control Click       strTitle=Open   strText=&Open       strControl=Button1      strButton=LEFT      nNumClicks=1
    
    # Control Focus       strTitle=Open     strText=${EMPTY}       strControl=Edit1
    # Control Set Text        strTitle=Open       strText=${EMPTY}        strControl=Edit1        strControlText=C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao\\Teste.xlsx
    # # Send        C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao\\Teste.xlsx    
    # #Send    {Enter}   
    # # Control Focus       strTitle=Open      strText=&Open    strControl=Button1
    # # Capture Page Screenshot      
    # # Sleep       3s
    # Control Click       strTitle=Open     strText=${EMPTY}       strControl=Button1
    # strTitle=, strText=, strControl=, strButton=LEFT, nNumClicks=1, nX=-2147483647, nY=-2147483647
    # Choose File      C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao    ${CURDIR}    ${/}Teste.xlsx
    
# E pesquisar a configuracao de coluna das PreCargas ja definido
#     Title Should Be     Importação de Arquivo
#     Wait Until Element Is Visible       ///*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
#     Sleep       5s
#     Set Focus To Element        //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
#     Click Button        //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
#     Capture Element Screenshot      //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
#     Sleep       3s

# E processar o arquivo
#     Title Should Be     Buscar Configuração de Coluna
#     Wait Until Element Is Visible       //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
#     Sleep       5s
#     Set Focus To Element        //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
#     Click Element       //*[(@class='paginate_button next')]//a[contains(text(),'Próximo')]
#     Wait Until Element Is Visible       //*[@id="19"]/td[2]/a
#     Sleep       3s
#     Set Focus To Element        //*[@id="19"]/td[2]/a
#     Click Element       //*[@id="19"]/td[2]/a
#     Wait Until Element Is Visible       //*[@class="table table-hover table-bordered dataTable main-table"]/thead/tr/th[5]/select/option[19]
#     Sleep       3s
#     Set Focus To Element        //*[@class="table table-hover table-bordered dataTable main-table"]/thead/tr/th[5]/select/option[19]
#     Click Element       //*[@class="table table-hover table-bordered dataTable main-table"]/thead/tr/th[5]/select/option[19]
#     Wait Until Element Is Visible       //footer//*[@class="btn btn-labeled btn-success"]//*[contains(text(),'Processar')]
#     Sleep       3s
#     Set Focus To Element        //footer//*[@class="btn btn-labeled btn-success"]//*[contains(text(),'Processar')]
#     Click Element       //footer//*[@class="btn btn-labeled btn-success"]//*[contains(text(),'Processar')]

# ENTAO a tela com a listagem das PreCargas deve ser exibida
# //*[(@class='close')]