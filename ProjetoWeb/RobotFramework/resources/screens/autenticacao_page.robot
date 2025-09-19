*** Settings ***
Documentation     Page Inspector da Tela de Autenticação

Resource    ../base.robot
Resource    ../hooks.robot

*** Variables ***
### HOME E LOGIN
${MENU_LOGO_HOME}                          id=header_logo
${MENU_LOGIN}                              css:a.login
${INPUT_EMAIL_LOGIN}                       id=email 
             
${INPUT_SENHA}                             id=passwd
${BOTAO_LOGIN}                             id=SubmitLogin
${ALERTA_LOGIN_INVALIDO}                   css=.alert-danger

### LOGOUT
${BOTAO_LOGOUT}                            xpath=//a[text()='Sign out']

### CRIAÇÃO DE CONTA
${CRIAR_CONTA}                             id=SubmitCreate
${INPUT_EMAIL_NOVA CONTA}                  id=email_create
${FEEDBACK_EMAIL_INVALIDO}                 xpath=//li[text()='Invalid email address.'] 
${BOTAO_SELECAOMr}                         id=id_gender1
${BOTAO_SELECAOMrs}                        id=id_gender2
${INPUT_FIRSTNAME}                         id=customer_firstname
${INPUT_LASTTNAME}                         id=customer_lastname 
${INPUT_NOVASENHA}                         id=passwd
${BOTAO_REGISTRARCONTA}                    id=submitAccount
${ALERTA_ERRO_DADOSPESSOAIS_INVALIDO}      css=div.alert.alert-danger