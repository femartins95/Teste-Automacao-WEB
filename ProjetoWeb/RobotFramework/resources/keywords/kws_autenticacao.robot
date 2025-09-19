*** Settings ***
Documentation     Página com as Keywords do site My Shop e login
 
Resource    ../base.robot
Resource    ../hooks.robot

*** Keywords ***
# Cenario 01: Acessar a home do 'My Shop' com sucesso
Dado que eu acesse o site 'My Shop'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Abrindo Navegador e acessando o site
    Log To Console  ==============================================================================
    Go To   ${URL}   
    Sleep    5                                                                            

Quando estiver na 'home do site'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Validando que acessei o site
    Log To Console  ==============================================================================
    Wait Until Element Is Visible  ${MENU_LOGO_HOME}                                                                         

Então visualizo o título da página 'My Shop'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Validando que acessei o site e encontrei o logo da home 
    Log To Console  ==============================================================================
    Wait Until Element Is Visible  ${MENU_LOGO_HOME} 
    Capture Page Screenshot

# Cenario 02: Validar quando informar 'Email' e 'Senha' e senha inválida no 'My Shop' recebo feedback
Dado que eu esteja na tela de login do 'My Shop'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Abrindo Navegador e acessando o site
    Log To Console  ==============================================================================
    Go To   ${URL}   
    Sleep    5
    Capture Page Screenshot
    Click Element   ${MENU_LOGIN}

E preencher o campo 'Email' e 'Senha' com dados não cadastrados no 'My Shop'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Informando 'E-mail' e 'Senha' inválida
    Log To Console  ============================================================================== 
    Scroll Element Into View        ${CRIAR_CONTA}
    Sleep    2 
    SeleniumLibrary.Input Text       ${INPUT_EMAIL_LOGIN}    testuser@example.com
    SeleniumLibrary.Input Text       ${INPUT_SENHA}    0000000
    Capture Page Screenshot

Quando clicar no botão 'Sign in'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botão 'Sign in'
    Log To Console  ==============================================================================
    Sleep    2
    Wait Until Page Contains Element    ${BOTAO_LOGIN}                                           30
    Click Button    ${BOTAO_LOGIN}
    Sleep    2
    Capture Page Screenshot

Então usuário recebe feedback
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário recebe feedback após informar 'E-mail' e 'Senha' inválida
    Log To Console  ==============================================================================
    Sleep    2
    Wait Until Page Contains Element    ${ALERTA_LOGIN_INVALIDO}    10s
    Sleep    2
    Capture Page Screenshot

# Cenario 03: Validar quando informar 'Email' e 'Senha' e senha corretos no 'My Shop' consigo logar com sucesso
E preencher o campo 'Email' e 'Senha' corretos no 'My Shop'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Informando 'E-mail' e 'Senha' correta
    Log To Console  ============================================================================== 
    Scroll Element Into View        ${CRIAR_CONTA}
    Sleep    2 
    SeleniumLibrary.Input Text       ${INPUT_EMAIL_LOGIN}    projeto.teste@gmail.com
    SeleniumLibrary.Input Text       ${INPUT_SENHA}    Teste@12345
    Capture Page Screenshot
    
Então usuário consegue logar com sucesso
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário consegue logar com sucesso
    Log To Console  ============================================================================== 
    Sleep    2 
    Wait Until Page Contains Element    ${BOTAO_LOGOUT}                                         30
    Capture Page Screenshot

### UTILIZADO PARA OS TESTES DE CATALOGO
E clicar no botão 'Sign in'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botão 'Sign in'
    Log To Console  ==============================================================================
    Sleep    2
    Wait Until Page Contains Element    ${BOTAO_LOGIN}                                           30
    Click Button    ${BOTAO_LOGIN}
    Sleep    2
    Capture Page Screenshot