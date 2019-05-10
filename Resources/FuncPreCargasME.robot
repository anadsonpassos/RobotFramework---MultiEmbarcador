*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLPreCarga}      https://carrefourhomo.multiembarcador.com.br/#PreCargas/PreCarga
${DescColuna}       AutomationImport
${DescMenssagem}        Processado com sucesso.

*** Keywords ***
###CENARIO 1
Dado que estou logado no sistema
    Title Should Be     Home
    Sleep       3s

Quando eu acessar menu Gestao de Patio e sub-menu Pre Cargas
    Go To        ${URLPreCarga}   
    # Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[3]/a/span
    # Click Element     //*[@id="ulMenuSistema"]/li[3]/a/span
    # Wait Until Element is Visible     //*[@id="ulMenuSistema"]/li[3]/ul/li[3]/a
    # Click Element     //*[@id="ulMenuSistema"]/li[3]/ul/li[3]/a

Entao a tela de PreCargas deve ser mostrada
    Title Should Be     Pré Cargas

###CENARIO 2
DADO que estou na tela do Windows
    Sleep       5s
    Wait Until Element Is Visible       //input[@value='Importar']     
    Sleep       5s
    Set Focus To Element        //input[@value='Importar']      
    Press Keys    //input[@value='Importar']    SPACE 
    Sleep       7s
    #Capture Element Screenshot      //input[@value='Importar'] 

QUANDO eu importar o arquivo desejado das PreCargas
    Win Wait Active     WindowTitle=Abrir
    Control Focus       strTitle=Abrir     strText=${EMPTY}       strControl=Edit1
    Control Set Text        strTitle=Abrir       strText=${EMPTY}        strControl=Edit1        strControlText=C:\\Users\\brext897\\Desktop\\PreCarga_Integracao\\TemplateImportaçãoPlanejamentoPCPv6.xlsx
    Control Click       strTitle=Abrir     strText=&Abrir       strControl=Button1
    Win Wait Active     WindowTitle=Abrir
    Control Focus       strTitle=Abrir     strText=${EMPTY}       strControl=Edit1
    Send        TemplateImportaçãoPlanejamentoPCPv6.xlsx
    Send        {Enter}
  
E pesquisar a configuracao de coluna das PreCargas ja definido
    Set Focus To Element      //*[@data-bind="visible: ConfiguracaoColuna.visible"]
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
    Click Element      //*[@id="32"]/td[2]
    Sleep       3s
    Set Focus To Element         //*[@class="table-container"]
    Click Element        //thead//tr/th[15]//select//option[18]
    Sleep       3s
            
E processar o arquivo escolhido
    Click Element       //tbody//tr[1]//td[18]
    Sleep       3s
    Click Button        //button[@data-bind="click: Processar.eventClick, visible: Processar.visible, attr: { id : Processar.id}"]
    Capture Element Screenshot      //button[@data-bind="click: Processar.eventClick, visible: Processar.visible, attr: { id : Processar.id}"]
    Sleep       7s
    
ENTAO a tela de Importacao de Arquivo deve apresentar os arquivos processados com sucesso
    Set Focus To Element        //div[contains(@class,"modal-dialog modal-dialog-importacao")]//h4[contains(@class, "modal-title")]  
    Page Should Contain Element        //div[contains(@class,"modal-dialog modal-dialog-importacao")]//h4[contains(@class, "modal-title")]     Importação de Arquivo
    Wait Until Element Is Visible       //tbody/tr[1]/td[17]
    Set Focus To Element        //tbody/tr[1]/td[17]
    Sleep       5s
    Element Text Should Be     //tbody/tr[1]/td[17]     ${DescMenssagem}
    
E baixar o retorno do processamento do arquivo
    Click Button        //footer//button[contains(@data-bind, "click: DownloadRetornoProcessamento.eventClick,")]
    Sleep       3s
    Click Button        //div[contains(@class,"modal-dialog modal-dialog-importacao")]//button[contains(@class, "close")]
