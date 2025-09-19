*** Settings ***
Documentation     Página de Configuração

Resource    base.robot

*** Variables ***
# ${BROWSER}  chrome
${URL}        http://www.automationpractice.pl/index.php

*** Keywords ***
Open Application
    Open Browser    browser=chrome
    Maximize Browser Window

Close Application
    Close Browser

