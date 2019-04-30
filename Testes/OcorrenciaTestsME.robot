Documentation       Cadastro de Ocorrencia. "As ocorrências são acontecimentos relacionados a carga, e serão reconhecidas pelos Tipos de Ocorrência   cadastrados"

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
    Quando eu escolher um Tipo de Ocorrencia
    E escolher a quinzena que desejo gerar a Ocorrencia
    E escolher o Transportador para qual quero gerar a Ocorrencia
    E informar uma observacao referente a Ocorrencia
    E informar o valor da Ocorrencia
    E informar uma observacao que devera ser impressa no CTE
    E clicar no botao Adicionar
    Entao o sistema deve cadastrar a Ocorrencia com status ativo