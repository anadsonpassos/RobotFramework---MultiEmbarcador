*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLAutorizacaoOcorrencia}     https://carrefourhomo.multiembarcador.com.br/#Ocorrencias/AutorizacaoOcorrencia
${Saudacao}     Bem vindo ao Multi Embarcador
${NomeTelaAutorizacaoOcorre}        Autorização de Ocorrências
${TelaPesquisaOcorrencia}       Pesquisar Ocorrências 

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

Entao a tela Autorizacao de Ocorrencias de Carga deve ser mostrada
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Sleep       7s
    Element Should Contain      //*[@id="widget-grid"]/div[1]/div/h2      ${NomeTelaAutorizacaoOcorre}
    Sleep       7s

###CENARIO 2: Consultar Ocorrencia Gerada
Dado que eu tenha acesso para Pesquisar a Ocorrencia Gerada
    Element Should Contain       //*[@id="knockoutPesquisaOcorrencias"]/div[1]/header        ${TelaPesquisaOcorrencia}

Quando eu pesquisar pelo numero da Ocorrencia
    Input Text      //*[contains(@data-bind,"value: NumeroOcorrencia.val")]     ${NumeroOcorrencia}

# Entao a Ocorrencia Cadastrada deve ser exibida na tela