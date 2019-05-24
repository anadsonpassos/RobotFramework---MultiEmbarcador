*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLCancelamentoCargas}      https://carrefourhomo.multiembarcador.com.br/#Cargas/CancelamentoCarga
${Saudacao}     Bem vindo ao Multi Embarcador
${NomeTelaCancelamentoCarga}        Cancelamento de Carga
${CNPJ}     000766315000144

*** Keywords ***
###CENARIO 1: Acessar a tela de Ocorrencia
Dado que eu estou logado no sistema
    Title Should Be     Home
    Sleep       5s
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="saudacao"]      ${Saudacao}
    Sleep       5s

Quando eu acessar o menu Gestao de Cargas e sub-menu Cancelamento
    Go To       ${URLCancelamentoCargas}
    Sleep       5s

Entao a tela Cancelamento de Cargas deve ser exibida
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="widget-grid"]/div[1]/div/h2      ${NomeTelaCancelamentoCarga}
    Sleep       7s

###CENARIO 2: Pesquisar uma carga para realizar o cancelamento
Dado que eu tenha acesso a pesquisar Carga na tela de Cancelamento
    Click Button        //*[@data-bind="enable : Carga.enable, attr: { id: Carga.idBtnSearch}"]
    Sleep       4s

Quando eu pesquisar pelo Transportador que quero cancelar a carga
    Click Button        //*[contains(@data-bind,"click: BuscaAvancada.eventClick")]
    Sleep       4s  
    Input Text        //input[contains(@data-bind,"value: CNPJ.val, valueUpdate: 'afterkeydown',")]     ${CNPJ}
    Sleep       9s
    Click Button        //div[contains(@class,"modal-dialog modal-lg")]//*[@class="btn btn-default btn-primary btnPesquisarFiltroPesquisa"]
    Sleep       8s
    Wait Until Element Is Visible       //*[@id="8"]/td[6]
    Click Element       //*[@id="8"]/td[6]
    Sleep       8s

E clicar no botao Pesquisar
Entao o sistema devera exibir a grid com as cargas
    
   