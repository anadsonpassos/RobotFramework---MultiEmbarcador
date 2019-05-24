*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLAutorizacaoOcorrencia}     https://carrefourhomo.multiembarcador.com.br/#Ocorrencias/AutorizacaoOcorrencia
${Saudacao}     Bem vindo ao Multi Embarcador
${NomeTelaAutorizacaoOcorre}        Autorização de Ocorrências
${TelaPesquisaOcorrencia}       Pesquisar Ocorrências
${AutInformacoesOcorrencia}     Informações da Ocorrências
${Situacao}     Em Emissão Documento Complementar       #Finalizada

*** Keywords ***
###CENARIO 1: Acessar a tela de Autorizacao de Ocorrencia
Dado que eu estou logado no sistema
    Title Should Be     Home
    Sleep       5s
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="saudacao"]      ${Saudacao}

Quando eu acessar menu Ocorrencias e sub-menu Autorizacao 
    Go To       ${URLAutorizacaoOcorrencia}

Entao a tela Autorizacao de Ocorrencias de Carga deve ser exibida
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="widget-grid"]/div[1]/div/h2      ${NomeTelaAutorizacaoOcorre}
    Sleep       7s

###CENARIO 2: Consultar Ocorrencia Gerada
Dado que eu tenha acesso para Pesquisar a Ocorrencia Gerada
    Element Should Contain       //*[@id="knockoutPesquisaOcorrencias"]/div[1]/header        ${TelaPesquisaOcorrencia}

Quando eu pesquisar pelo numero da Ocorrencia
    Input Text      //*[contains(@data-bind,"value: NumeroOcorrencia.val")]     ${NumeroOcorrencia}
    Sleep       3s
    Click Button        //*[@class="btn btn-default btn-primary btnPesquisarFiltroPesquisa"]
    Sleep       5s
    Click Element       //a[contains(@class,"clasEditar")]
    Sleep       5s

Entao o sistema devera abrir a tela com os detalhes da Ocorrencia
    Wait Until Element Is Visible       //*[@id="divModalOcorrencia"]/div/div/div[1]
    Element Should Contain      //*[@id="divModalOcorrencia"]/div/div/div[1]        ${AutInformacoesOcorrencia}
    Sleep       5s

###CENARIO 3: Autorizar Ocorrencia Gerada
Dado que eu esteja na aba de Autorizacao
    Click Element       //*[@id="liAutorizacao"]/a
    Sleep       3s
Quando eu clicar para aprovar a Autorizacao da Ocorrencia
    Click Element       //*[@data-bind="click: AprovarTodas.eventClick, attr: { id: AprovarTodas.id}"]
    Sleep       4s
    Wait Until Element Is Visible       //*[@id="Msg1"]
    Sleep       5s
    Set Focus To Element       //*[@id="Msg1"]
    Sleep       5s
    Click Button        //*[@id="bot2-Msg1"]
    Sleep       6s

E aprovar a Emissao da Ocorrencia
    Click Element       //*[@data-bind="click: AprovarTodas.eventClick, attr: { id: AprovarTodas.id}"]
    Sleep       5s
    Wait Until Element Is Visible       //*[@id="Msg1"]
    Sleep       5s
    Set Focus To Element       //*[@id="Msg1"]
    Sleep       5s
    Click Button        //*[@id="bot2-Msg1"]
    Sleep       5s
    Click Element       //*[@id="divModalOcorrencia"]/div/div/div[1]/button
    Sleep       7s

Entao o sistema devera aprovar a Ocorrencia gerada
    Click Element       //*[contains(@data-bind,"options: Situacao")]/option[1]
    Sleep       5s
    Click Button        //*[@class="btn btn-default btn-primary btnPesquisarFiltroPesquisa"]
    Sleep       5s
    Click Element       //a[contains(@class,"clasEditar")]
    Sleep       6s
    Element Text Should Be      //*[@id="knockoutOcorrencia"]/fieldset/div[2]/section[1]/label/span    ${Situacao}