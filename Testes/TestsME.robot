*** Settings ***
Resource        ../Resources/MultiEmbarcador.robot

### Setup ele roda Keyword antes da suite ou de um teste
### TearDown ele roda keyword depois de uma suite ou um teste
Suite Setup     Abrir Navegador                                 ### Roda antes da suite
Suite Teardown      Fechar Navegador                            ### Roda depois da suite
# Test Setup      Abrir Navegador                                 ### Roda antes do teste
# Test Teardown       Fechar Navegador                              ### Roda depois do teste

*** Test Cases ***
Cenario 1: Validar Login
    DADO que eu estou na tela de login do sistema
    QUANDO o usuario logar com login e senha validos 
    ENTAO a pagina home deve ser mostrada

# Cenario 2: Entrar na tela pesquisa de carga
#     Dado que esteja logado no sistema MultiEmbarcador
#     Quando acesso o menu Gestao de Carga
#     Entao devo navegar no menu e acionar a opcao Cargas
#     E validar o titulo da pagina

Cenario 2 - Listagem de cargas
	DADO que estou na tela de Cargas
    QUANDO eu solicitar acesso as cargas existentes sub-menu Cargas
	ENTAO a tela com a listagem das cargas deve ser exibida

Cenario 3: Consulta de cargas
    DADO que estou na tela de pesquisa por filtros
    QUANDO eu pesquisar a carga existente com os parametros "numero e filial"
    #ENTAO a carga existente deve ser mostrada

    # E acionar o botao Cargas Novas

#     BDD boas práticas!!
# Se baseie sempre nesse molde:
# DADO QUE <estado atual, página atual, localização atual>
# QUANDO <ação do usuário no sistema>
# ENTÃO <resultados e comportamentos esperados>

# O E é uma continuidade, se vc estiver no DADO QUE, o E dele deve significar um estado tmb, 
# se tiver no QUANDO o E dele deve ser para ações, 
# é mto comum o usuario fazer varias ações e as vezes é melhor automatizar separadas, 
# entao o E ajuda, e o E do ENTAO é apra as diversas conferencias necessárias!!

# Cenario Exemplo

# DADO QUE estou logado no sistema de Cargas
# E sou um usuário administrador
# QUANDO eu pesquisar pelas cargas existentes
# E ordená-las por data
# ENTÃO a listagem de cargas existentes deve ser mostrada
# E essa listagem deve estar devidamente ordenada pela data

# 1 - Lembre que o BDD não deve ser técnico, deve exemplificar como o usuário interage com o sistema, 
# para ficar melhor umas ideias:

# Troque: Quando informar usuario/senha acionar o botao Acessar --- por --- Quando o usuário logar com login e senha válidos
# Troque: Entao devo esta logado na tela Home --- por --- Entao a página home deve se mostrada

# 2 - O cenário 2 não me parece um teste. Veja voce está testando se a tela é carregada, 
# isso pode ser feito dentro do DADO QUE. No DADO QUE pode existir conferências tmb, sem problemas!! 
# Essa teste poderia ser:
#     Cenário 2 - Listagem de cargas
# 	DADO QUE estou na tela de Gestão de Cargas
# 	QUANDO eu solicitar acesso às cargas existentes
# 	ENTÃO a tela com a listagem das cargas deve ser exibida


