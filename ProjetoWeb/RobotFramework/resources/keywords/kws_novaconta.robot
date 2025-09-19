*** Settings ***
Documentation     Página com as Keywords do site My Shop Criação de Conta
 
Resource    ../base.robot
Resource    ../hooks.robot

*** Keywords ***
# Cenario 01: Validar quando estiver criando minha conta e informar um 'Email' inválido não consigo seguir com a criação da minha conta
E preencher o campo informar um 'Email' inválido 'My Shop' 
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Informando 'E-mail' inválido
    Log To Console  ============================================================================== 
    Sleep    2 
    # SeleniumLibrary.Input Text       ${INPUT_EMAIL_NOVA CONTA}   @testmail.com
    Capture Page Screenshot

Quando clicar no botão 'Create an account'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botão 'Create an account'
    Log To Console  ==============================================================================
    Sleep    2
    Scroll Element Into View        ${CRIAR_CONTA}                                              
    Click Button    ${CRIAR_CONTA}
    Click Button    ${CRIAR_CONTA}
    Sleep    2                                                              
    Capture Page Screenshot

Então usuário recebe feedback 'Invalid email address.'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário recebe feedback após informar 'E-mail' inválido
    Log To Console  ==============================================================================
    Sleep    2
    Wait Until Page Contains Element    ${FEEDBACK_EMAIL_INVALIDO}                              10
    Capture Page Screenshot

# Cenario 02: Validar quando estiver criando minha conta e informar um 'Email' e demais dados pessoais incorretos não consigo concluir o cadastro de minha conta
E preencher formulário com 'Dados pessoais' inválidos
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Preencher formulário com 'Dados pessoais' inválidos
    Log To Console  ==============================================================================
    Capture Page Screenshot
    Wait Until Page Contains Element    ${BOTAO_SELECAOMr}                                      30 
    Click Element    ${BOTAO_SELECAOMr} 
    Click Element    ${BOTAO_SELECAOMr} 
    Click Element    ${INPUT_FIRSTNAME}  
    Sleep    2                                                        
    Input Text    ${INPUT_FIRSTNAME}     1
    Input Text    ${INPUT_LASTTNAME}     2                                                
    Sleep    2     
    Input Text   ${INPUT_NOVASENHA}      3
    Select From List By Value    id=days     5
    Select From List By Value    id=months   5
    Select From List By Value    id=years    1990
    Sleep    2 
    Scroll Element Into View        ${BOTAO_REGISTRARCONTA} 
    Capture Page Screenshot

Então usuário recebe feedback 'There are 3 errors'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botão Registrar Conta
    Log To Console  ==============================================================================
    Sleep    3                                          
    Wait Until Page Contains Element    ${BOTAO_REGISTRARCONTA}                                 30 
    Click Button    ${BOTAO_REGISTRARCONTA} 
    Sleep    2                                                              
    Capture Page Screenshot
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário recebe feedback após formulário com 'Dados pessoais' inválidos
    Log To Console  ==============================================================================
    Sleep    2
    Wait Until Page Contains Element    ${ALERTA_ERRO_DADOSPESSOAIS_INVALIDO}                   30
    Capture Page Screenshot

# Cenario 02: Validar quando estiver criando minha conta e informar um 'Email' e demais dados pessoais corretamente consigo concluir o cadastro de minha conta
E preencher o campo informar um 'Email' valido 'My Shop' 
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Informando 'E-mail' valido
    Log To Console  ============================================================================== 
    Sleep    2 
        # Gera email randomico para não duplicar
    ${random}=    Generate Random String    6    [LETTERS]
    ${email}=     Catenate    ${random}@testmail.com
    Input Text    ${INPUT_EMAIL_NOVA CONTA}    ${email}

E preencher formulário com 'Dados pessoais'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Preencher formulário com 'Dados pessoais'
    Log To Console  ==============================================================================
    Capture Page Screenshot
    Wait Until Page Contains Element    ${BOTAO_SELECAOMr}                                      30 
    Click Element    ${BOTAO_SELECAOMr} 
    Click Element    ${BOTAO_SELECAOMr} 
    Click Element    ${INPUT_FIRSTNAME}  
    Sleep    2                                                        
    Input Text    ${INPUT_FIRSTNAME}     Teste
    Input Text    ${INPUT_LASTTNAME}     Usuario                                                
    Sleep    2     
    Input Text   ${INPUT_NOVASENHA}      123@abc
    Select From List By Value    id=days     5
    Select From List By Value    id=months   5
    Select From List By Value    id=years    1990
    Sleep    2 
    Scroll Element Into View        ${BOTAO_REGISTRARCONTA} 
    Capture Page Screenshot

Então usuário consegue concluir a criação da sua conta 
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botão Registrar Conta
    Log To Console  ==============================================================================
    Sleep    3                                          
    Wait Until Page Contains Element    ${BOTAO_REGISTRARCONTA}                                 30 
    Click Button    ${BOTAO_REGISTRARCONTA} 
    Sleep    2                                                              
    Capture Page Screenshot