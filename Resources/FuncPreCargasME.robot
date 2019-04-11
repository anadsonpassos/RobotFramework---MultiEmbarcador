*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLPreCarga}      https://carrefourhomo.multiembarcador.com.br/#PreCargas/PreCarga
${DescColuna}       PRECARGA V5

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
    Sleep       5s
    Wait Until Element Is Visible       //input[@value='Importar']     
    Sleep       5s
    Set Focus To Element        //input[@value='Importar']      
    Press Keys    //input[@value='Importar']    SPACE 
    Sleep       5s
    #Capture Element Screenshot      //input[@value='Importar'] 

Quando eu importar o arquivo desejado das PreCargas
    Win Wait Active     WindowTitle=Abrir
    AutoItLibrary.Control Focus       strTitle=Abrir     strText=${EMPTY}       strControl=Edit1
    Control Set Text        strTitle=Abrir       strText=${EMPTY}        strControl=Edit1        strControlText=C:\\Users\\brext897\\Desktop\\PreCarga_Integracao\\Teste.xlsx
    Control Click       strTitle=Abrir     strText=&Abrir       strControl=Button1
    Win Wait Active     WindowTitle=Abrir
    Control Focus       strTitle=Abrir     strText=${EMPTY}       strControl=Edit1
    Send        Teste.xlsx
    Send        {Enter}
    #Control Click       strTitle=Open   strText=&Open       strControl=Button1      strButton=LEFT      nNumClicks=1
    
    #  Win Wait Active     ${TELA_SELECIONAR_ARQUIVO}
    # Control Focus       strTitle=${CAMPONOMEARQUIVO.title}
    # ...                 strText=${CAMPONOMEARQUIVO.text}
    # ...                 strControl=${CAMPONOMEARQUIVO.control}
    # Send                ${ARQUIVO}
    # Control Click       strTitle=${BOTAOABRIRARQUIVO.title}
    # ...                 strText=${BOTAOABRIRARQUIVO.text}
    # ...                 strControl=${BOTAOABRIRARQUIVO.control}
    # Control Focus       strTitle=Open     strText=${EMPTY}       strControl=Edit1
    # Control Set Text        strTitle=Open       strText=${EMPTY}        strControl=Edit1        strControlText=C:\\Users\\Anadsonp\\Desktop\\PreCarga_Integracao\\Teste.xlsx
    # Control Click       strTitle=Open     strText=${EMPTY}       strControl=Button1
    
E pesquisar a configuracao de coluna das PreCargas ja definido
    Set Focus To Element      //*[@data-bind="visible: ConfiguracaoColuna.visible"]
    #Title Should Be     Pré Cargas
    Wait Until Element Is Visible       //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
    Sleep       5s
    Set Focus To Element        //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
    Click Button        //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
    Capture Element Screenshot      //*[@data-bind="attr: { id: ConfiguracaoColuna.idBtnSearch}"]
    Sleep       3s
    Set Focus to Element        //*[@id="myModalLabel"]
    Sleep       5s
    Input Text      //div[contains(@class,"modal-dialog modal-lg")]//input[contains(@data-bind,"value: Descricao.val, valueUpdate:") and contains(@data-bind,"afterkeydown") and contains(@data-bind, "attr")]        ${DescColuna}
    Click Button      //*[@data-bind="click: Pesquisar.eventClick, attr : { id: Pesquisar.id }"]
    Sleep       5s
    Click Element      //*[@id="19"]/td[2]/a
    Sleep       3s
    Set Focus To Element         //*[@class="table-container"]
    Click Element        th[data-width="150"]/*option[value="removecoluna"]thead/tr/th[4]/select/option[6]        
    #//*[@data-bind="value: Descricao.val, valueUpdate: 'afterkeydown',  attr: { maxlength: Descricao.maxlength, id : Descricao.id, }"]        AnadsonAutomacao

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