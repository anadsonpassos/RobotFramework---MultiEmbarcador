*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${URLOcorrencia}      https://carrefourhomo.multiembarcador.com.br/#Ocorrencias/Ocorrencia
${Saudacao}     Bem vindo ao Multi Embarcador
${NomeTelaOcorrencia}       Ocorrências de Carga

*** Keywords ***
###CENARIO 1: Acessar a tela de Ocorrencia
Dado que eu estou logado no sistema
    Title Should Be     Home
    Sleep       3s
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Element Should Contain      //*[@id="saudacao"]      ${Saudacao}
    Sleep       3s

Quando eu acessar menu Ocorrencias e sub-menu Ocorrencia
    Go To       ${URLOcorrencia}
    Sleep       3s

Entao a tela Ocorrencia de Carga deve ser mostrada
    Element Should Be Focused        //html//body[@class="smart-style-0 desktop-detected"]
    Element Should Contain      //*[@id="content"]      ${NomeTelaOcorrencia}

####CENARIO 2: Gerar Ocorrencia
Dado que eu tenha acesso para cadastra Ocorrencia
    Element Should Contain      //*[@id="knockoutCadastroDeOcorrencia"]/div[1]/header       Cadastrar Ocorrência

Quando eu escolher um Tipo de Ocorrencia no campo especifico
    Click Button        //*[@data-bind="enable : TipoOcorrencia.enable,attr: { id: TipoOcorrencia.idBtnSearch}"]
    Sleep       3s
    Click Element       //*[@id="1071"]/td[5]/a 
# E Escolher a carga para a gerada Ocorrencia
# E esolher os CTes pertencentes a carga escolhida
# E informar o valor da Ocorrencia
# E informar uma observacao referente a Ocorrencia
# E clicar no botao Adicionar
# Entao o sistema deve cadastrar a Ocorrencia com sucesso       