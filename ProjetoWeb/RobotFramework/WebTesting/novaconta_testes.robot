*** Settings ***
Documentation     Página com as Keywords do site My Shop Criação de Conta

Resource    ../resources/base.robot
Resource    ../resources/hooks.robot
Resource    ../resources/keywords/kws_autenticacao.robot

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Cenario 01: Validar quando estiver criando minha conta e informar um 'Email' inválido não consigo seguir com a criação da minha conta
    [Tags]    CriacaoConta    CriacaoContaEmailinválido
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo informar um 'Email' inválido 'My Shop' 
    Quando clicar no botão 'Create an account'
    Então usuário recebe feedback 'Invalid email address.'

Cenario 02: Validar quando estiver criando minha conta e informar um 'Email' e demais dados pessoais incorretos não consigo concluir o cadastro de minha conta
    [Tags]    CriacaoConta    CriacaoContaEmaiValidoDadosPessoaisIncorretos
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo informar um 'Email' valido 'My Shop' 
    Quando clicar no botão 'Create an account'
    E preencher formulário com 'Dados pessoais' inválidos
    Então usuário recebe feedback 'There are 3 errors'

Cenario 03: Validar quando estiver criando minha conta e informar um 'Email' e demais dados pessoais corretamente consigo concluir o cadastro de minha conta
    [Tags]    CriacaoConta    CriacaoContaEmailValidoDadosPessoaisCorretos
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo informar um 'Email' valido 'My Shop' 
    Quando clicar no botão 'Create an account'
    E preencher formulário com 'Dados pessoais'
    Então usuário consegue concluir a criação da sua conta 