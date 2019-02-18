*** Settings ***
Resource        ../Resources/FuncPreCargas.robot
Suite Setup     FuncCargasME.Abrir Navegador
Suite Teardown      FuncCargasME.Fechar Navegador

*** Test Cases ***
Cenario 1: Acessar a tela de Pre-Cargas
    Dado que estou na tela de PreCargas
    Quando eu solicitar o acesso a tela de PreCargas
    Entao a tela de PreCargas deve ser mostrada

Cenario 2: Importar um arquivo na tela de PreCargas
    Dado que estou na tela do Windows
    Quando eu escolher o arquivo a ser importado
    E selecionar a opcao de modelos de PreCargas definido
    ENTAO a tela com a listagem das PreCargas deve ser exibida
    
          