*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLOcorrencia}      https://carrefourhomo.multiembarcador.com.br/#Ocorrencias/Ocorrencia
${Saudacao}     Bem vindo ao Multi Embarcador
${NomeTelaOcorrencia}       Ocorrências de Carga
${TelaCadastroOcorrencia}      Cadastrar Ocorrência
${NomeOcorrencia}       DomingosFeriados
${CNPJ}     000766315000144
${ObsOcorrencia}        Testes de automação para que seja facilitado o nosso dia-a-dia no trabalho.
${ValorOcorrencia}      350,99
${ObservacaoCTe}        O documento tem valor fiscal, emita para testes somente no ambiente de homologação!

*** Keywords ***
###CENARIO 1: Acessar a tela de Ocorrencia
Dado que eu estou logado no sistema
    Title Should Be     Home
    Sleep       5s
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="saudacao"]      ${Saudacao}
    Sleep       5s

Quando eu acessar menu Ocorrencias e sub-menu Ocorrencia
    Go To       ${URLOcorrencia}
    Sleep       5s

Entao a tela Ocorrencia de Carga deve ser mostrada
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="content"]//*[@id="widget-grid"]/div[1]/div[1]/h2      ${NomeTelaOcorrencia}
    Sleep       7s

####CENARIO 2: Gerar Ocorrencia
Dado que eu tenha acesso para cadastra Ocorrencia
    Element Should Contain      //*[@id="knockoutCadastroDeOcorrencia"]/div[1]/header       ${TelaCadastroOcorrencia}

Quando eu escolher um Tipo de Ocorrencia
    Click Button        //*[@data-bind="enable : TipoOcorrencia.enable,attr: { id: TipoOcorrencia.idBtnSearch}"]
    Wait Until Element Is Visible       //div[contains(@tabindex,"-1")]//input[contains(@data-bind,"value: Descricao.val, valueUpdate:")]
    Input Text      //div[contains(@tabindex,"-1")]//input[contains(@data-bind,"value: Descricao.val, valueUpdate:")]     ${NomeOcorrencia}     
    Sleep       8s
    Click Button    //button[@data-bind="click: Pesquisar.eventClick, attr : { id: Pesquisar.id }"]
    Sleep       10s
    Wait Until Element Is Visible       //*[@id="1078"]/td[5]
    Click Element       //*[@id="1078"]/td[5]
    Sleep       8s
    
E escolher a quinzena que desejo gerar a Ocorrencia   
    Click Element       //select[contains(@data-bind,"options: PeriodoQuinzena.options, optionsText: 'text'")]//option[2]
    Sleep       8s
    
E escolher o Transportador para qual quero gerar a Ocorrencia    
    Click Button        //section[10]//*[@data-bind="enable : Empresa.enable,attr: { id: Empresa.idBtnSearch}"]
    Sleep       8s  
    Input Text        //input[contains(@data-bind,"value: CNPJ.val, valueUpdate: 'afterkeydown',")]     ${CNPJ}
    Sleep       9s
    Click Button        //div[contains(@class,"modal-dialog modal-lg")]//*[@class="btn btn-default btn-primary btnPesquisarFiltroPesquisa"]
    Sleep       8s
    Wait Until Element Is Visible       //*[@id="8"]/td[6]
    Click Element       //*[@id="8"]/td[6]
    Sleep       8s
    
E informar uma observacao referente a Ocorrencia    
    Input Text      //textarea[contains(@data-bind,"value: Observacao.val,enable")]        ${ObsOcorrencia}
    Sleep       5s

E informar o valor da Ocorrencia
    Input Text      //input[contains(@data-bind,"value: ValorOcorrencia.val")]      ${ValorOcorrencia}
    Sleep       8s

E informar uma observacao que devera ser impressa no CTE
    Input Text      //textarea[contains(@data-bind,"value: ObservacaoCTe.val")]     ${ObservacaoCTe}
    Sleep       3s

E clicar no botao Adicionar
    Click Button       //div[@id="knockoutCRUDCadastroOcorrencia"]//input[contains(@data-bind,"click: Adicionar.eventClick")]
    Sleep       10s                 
Entao o sistema deve cadastrar a Ocorrencia com status ativo       
    Element Should Be Visible       //*[contains(@class,"step green")]
    Sleep       6s

# //*[(@class="input")]//*[contains(@data-bind,"value: Descricao.val") and contains(@data-bind,"afterkeydown") and contains(@data-bind, "attr")]
# //*[@class="input"]//*[@data-bind="value: Descricao.val, valueUpdate: 'afterkeydown',  attr: { maxlength: Descricao.maxlength, id : Descricao.id, }"]
# //a[contains(@aria-expanded ,"true")]