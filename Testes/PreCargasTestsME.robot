*** Settings ***
Resource        ../Resources/ResourceCommon.robot
Resource        ../Resources/FuncPreCargasME.robot
Suite Setup     Open Browser To Login valid
#Suite Teardown      Fechar Navegador 

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
    DADO que estou na tela do Windows
    QUANDO eu importar o arquivo desejado das PreCargas
    E pesquisar a configuracao de coluna das PreCargas ja definido
    E processar o arquivo escolhido
    ENTAO a tela de Importacao de Arquivo deve apresentar os arquivos processados com sucesso
    E baixar o retorno do processamento do arquivo
    
          