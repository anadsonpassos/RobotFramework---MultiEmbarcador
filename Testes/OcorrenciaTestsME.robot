*** Settings ***
Resource        ../Resources/ResourceCommon.robot
Resource        ../Resources/FuncOcorrenciaME.robot
Suite Setup     Open Browser To Login valid
#Suite Teardown      Close Browser 

*** Test Cases ***
CENARIO 1: Acessar a tela de Ocorrencia
    Dado que eu estou logado no sistema
    Quando eu acessar menu Ocorrencias e sub-menu Ocorrencia 
    Entao a tela Ocorrencia de Carga deve ser mostrada

CENARIO 2: Gerar Ocorrencia
    Dado que eu tenha acesso para cadastra Ocorrencia
    Quando eu escolher um Tipo de Ocorrencia no campo especifico
    # E Escolher a carga para a gerada Ocorrencia
    # E esolher os CTes pertencentes a carga escolhida
    # E informar o valor da Ocorrencia
    # E informar uma observacao referente a Ocorrencia
    # E clicar no botao Adicionar
    # Entao o sistema deve cadastrar a Ocorrencia com sucesso