*** Settings ***
Resource        ../Resources/MeusTestsResource.robot

*** Test Cases ***
Cenario 1: Abrir site Carrefour e adicionar um produto no carrinho
    Dado que esteja logado site do Carrefour com o produto escolhido
    Quando pesquisar pela descricao do produto
    Entao devo adicionar produto no carrinho

Cenario 2: Excluir o produto no carrinho
    Dado que o produto ja esteja no carrinho devo excluir o produto do carrinho
    Quando o produto for excluido devo confirmar a exclusao
    Então valido a mensagem que o produto foi escluido

Fechar navegador
    Fechar o browser