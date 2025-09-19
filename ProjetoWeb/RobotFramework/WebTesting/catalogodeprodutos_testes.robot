*** Settings ***
Documentation     Página com as Keywords do site My Shop Catálogo de Produtos

Resource    ../resources/base.robot
Resource    ../resources/hooks.robot
Resource    ../resources/keywords/kws_autenticacao.robot

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Cenario 01: Validar quando estiver logado consigo navegar pelo catálogo de produtos
    [Tags]    CatalogoProdutos    CatalogoProdutosNavegaçãoWomen
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    E clicar no botão 'Sign in'
    E realizar navegação do menu Women
    E realizar navegação do menu Dresses
    E realizar navegação do menu T-shirts
    Quando realizar navegação dos menu Blog
    Então realizar navegação dos menus 

Cenario 02: Validar quando estiver logado consigo fazer uma busca por produto e clicar para visualizar mais detalhes do produto
    [Tags]    CatalogoProdutos    CatalogoProdutosPesquisa
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    E clicar no botão 'Sign in'
    E realizar uma busca por produto inválido
    Quando realizar uma busca por produto valido
    Então usuário consegue visualizar o produto pesquisado
    E clico sobre o produto pesquisado

Cenario 03: Validar quando estiver logado consigo selecionar um produto ao carrinho
    [Tags]    CatalogoProdutos    CatalogoProdutosSelecaoProduto
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    E clicar no botão 'Sign in'
    E realizar navegação do menu Dresses
    E clicar sobre o produto que quero comprar
    E seleciono o tamanho do produto que quero comprar
    Quando clicar no botão 'Add to cart'
    Então usuário consegue adicionar o produto ao carrinho
    E clicar no botão 'lixeira'

Cenario 04: Validar quando estiver logado após seleção de produto consigo saber o valor da compra e avançar para tela de endereço
    [Tags]    CatalogoProdutos    CatalogoProdutosSelecaoProdutoConfirmacao
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    E clicar no botão 'Sign in'
    E realizar navegação do menu Dresses
    E clicar sobre o produto que quero comprar
    E seleciono o tamanho do produto que quero comprar
    Quando clicar no botão 'Add to cart'
    E clicar no botão 'Proceed to checkout'
    E estou no checkout consigo validar os cálculos do carrinho
    Então usuário consegue validar os cálculos do carrinho avançando para tela de endereço