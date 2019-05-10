Documentation       Na Autorização de Ocorrências será possível realizar a pesquisa da Situação das Ocorrências. 
...                 Para que de acordo com a seleção, seja possível aprovar ou até mesmo rejeitar as ocorrências pendentes de aprovação.             

*** Settings ***
Resource        ../Resources/ResourceCommon.robot
Resource        ../Resources/FuncAutorizacaoOcorreME.robot 
Suite Setup     Open Browser To Login valid
#Suite Teardown      Close Browser 

*** Test Cases ***
CENARIO 1: Acessar a tela de Autorizacao de Ocorrencia
    Dado que eu estou logado no sistema
    Quando eu acessar menu Ocorrencias e sub-menu Autorizacao 
    Entao a tela Autorizacao de Ocorrencias de Carga deve ser mostrada

###CENARIO 2: Consultar Ocorrencia Gerada
    Dado que eu tenha acesso para Pesquisar a Ocorrencia Gerada
    Quando eu pesquisar pelo numero da Ocorrencia
    #Entao a Ocorrencia Cadastrada deve ser mostrada na tela

###CENARIO 3: Autorizar Ocorrencia Gerada