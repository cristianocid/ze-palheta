*** Settings ***

Resource    ../../../resources/services.robot

*** Test Cases ***
Login com Sucesso
    ${resp}=          Post Session         admin@zepalheta.com.br    pwd123

    Status Should Be    200        ${resp}

Senha Incorreta
    ${resp}=          Post Session         admin@zepalheta.com.br    abc123

    Status Should Be    401        ${resp}

Usuário não existe
    ${resp}=          Post Session         404@yahoo.com.br    pwd123

    Status Should Be    401        ${resp}