*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
###CENARIO 1
Dado que esteja logado site do Carrefour com o produto escolhido
    Open Browser    https://www.carrefour.com.br/p/5629500    chrome

Quando pesquisar pela descricao do produto    
    Page Should Contain     Smart TV LED 32" Philco PTV32G50SN HD 2 HDMI 1USB Preta com Conversor Digital Integrado
    
Entao devo adicionar produto no carrinho    
    Click Button        buyProductButtonBottom

###Cenario 2
Dado que o produto ja esteja no carrinho devo excluir o produto do carrinho
    Click Link      //*[@id="cartContent"]/div[5]/div[1]/ul/li/div[1]/div/div[2]/div[7]/a

Quando o produto for excluido devo confirmar a exclusao   
    Wait Until Element is Visible     //*[@id="removeEntry_0"]
    Click Element     //*[@id="removeEntry_0"]

Então valido a mensagem que o produto foi escluido
    Page Should Contain      O seu carrinho ainda está vazio.

Fechar o browser
    Close Browser
