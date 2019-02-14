*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../Resources/resourceteste.robot
*** Test Cases ***
Valid Login
    Acessar Pagina Principal
    Inserir login
    Inserir senha
    Fazer o login
    Validar pagina principal
    Fechar o browser