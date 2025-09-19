*** Settings ***
Documentation     Acesso ao site My Shop e login

Resource    ../resources/base.robot
Resource    ../resources/hooks.robot
Resource    ../resources/keywords/kws_autenticacao.robot

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Cenario 01: Acessar a home do 'My Shop' com sucesso
    [Tags]    Login    LoginAcessoSiteSucesso
    Dado que eu acesse o site 'My Shop'
    Quando estiver na 'home do site'
    Então visualizo o título da página 'My Shop'

Cenario 02: Validar quando informar 'Email' e 'Senha' e senha inválida no 'My Shop' recebo feedback
    [Tags]    Login    LoginComDadosinválidos
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' com dados não cadastrados no 'My Shop'
    Quando clicar no botão 'Sign in'
    Então usuário recebe feedback

Cenario 03: Validar quando informar 'Email' e 'Senha' e senha corretos no 'My Shop' consigo logar com sucesso
    [Tags]    Login    LoginComDadosinválidos
    Dado que eu esteja na tela de login do 'My Shop'
    E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    Quando clicar no botão 'Sign in'
    Então usuário consegue logar com sucesso