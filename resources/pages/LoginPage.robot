*** Settings ***
Documentation    Representação da página login com suas ações e elementos

Resource    ../base.robot

*** Keywords ***
Login With
    [Arguments]    ${email}    ${password}

    Input Text        id:txtEmail                       ${email}
    Input Text        css:input[placeholder=Senha]      ${password}
    Click Element     xpath://button[text()='Entrar']
