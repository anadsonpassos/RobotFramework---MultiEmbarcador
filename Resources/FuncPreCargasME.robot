*** Settings ***
Library     SeleniumLibrary
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
    Sleep       5s
    Set Focus To Element        //input[@value='Importar']      
    Press Keys    //input[@value='Importar']    SPACE 
    # Sleep    5s
    # Capture Element Screenshot      //input[@value='Importar'] 

Quando eu importar o arquivo desejado
    Sleep       5s
    # Choose File     1148        C:\Users\Anadsonp\Desktop\PreCarga_Integracao\Teste.xlsx 
    Control Focus       strTitle=Open     strText=${EMPTY}       strControl=Edit1
    Send        C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao\\Teste.xlsx
    Control Click       strTitle=Open
    Capture Element Screenshot 

E pesquisar a configuracao de coluna das PreCargas ja definido
    Wait Until Element Is Visible
    Sleep       5s
    Set Focus To Element
    Click Button
    Capture Element Screenshot

E processar o arquivo 

ENTAO a tela com a listagem das PreCargas deve ser exibida