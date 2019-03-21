*** Settings ***
Resource        ../Resources/FuncPreCargasME.robot
Resource        ../Resources/ResourceCommon.robot
Suite Setup     Open Browser To Login valid
#Suite Teardown      Close Browser 

*** Test Cases ***
CENARIO 1: Acessar a tela de Pre-Cargas
    Dado que estou logado no sistema
    Quando eu acessar menu Gestao de Patio e sub-menu Pre Cargas 
    Entao a tela de PreCargas deve ser mostrada

# CENARIO 2: Pesquisar PreCargas por periodo
#     Dado que estou na tela de PreCargas
#     Quando eu pesquisar PreCarga existentes com os parametros "DataInicial" 01/02/2019, "Remetente" CDA e "Filial" CDA
#     Entao as PreCargas deve ser mostrada 

CENARIO 2: Importar um arquivo na tela de PreCargas
    Dado que estou na tela do Windows
    Quando eu importar o arquivo desejado
    # E pesquisar a configuracao de coluna das PreCargas ja definido
    # E processar o arquivo 
    # ENTAO a tela com a listagem das PreCargas deve ser exibida
    
          