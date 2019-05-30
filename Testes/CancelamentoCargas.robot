Documentation       Cancelamento de Cargas. "O cancelamento de cargas tem o objetivo de realizar 
...                 o cancelamento de uma carga encerrada ou não."

*** Settings ***
Resource        ../Resources/ResourceCommon.robot
Resource        ../Resources/FuncCancelamentoCargas.robot
Suite Setup     Open Browser To Login valid
#Suite Teardown      Close Browser 

*** Test Cases ***
CENARIO 1: Acessar a tela de Cancelamento de Cargas
    Dado que eu estou logado no sistema
    Quando eu acessar o menu Gestao de Cargas e sub-menu Cancelamento
    Entao a tela Cancelamento de Cargas deve ser exibida   

CENARIO 2: Pesquisar uma carga para realizar o cancelamento
    Dado que eu tenha acesso a pesquisar Carga na tela de Cancelamento
    Quando eu pesquisar pelo Transportador que quero cancelar a carga
    E clicar no botao Pesquisar
    Entao o sistema devera exibir a grid com as cargas

CENARIO 3: Pesquisar uma carga para realizar o cancelamento
    Dado que eu tenha cargas para serem canceladas
    Quando eu informar o motivo do cancelamento da carga
    E marcar para que não seja duplicada
    E confirmar o cancelamento da carga
    #Entao o sistema devera cancelar a carga com sucesso
   