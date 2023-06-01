*** Settings ***

Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Update a customer
    # Cliente origem
    ${payload}=         Get Json    cid.json
    
    # Deleta o cliente se ja existir
    Delete Customer     ${payload['cpf']}

    # Cadastra o cliente
    ${resp}=            Post Customer        ${payload}
    
    # Pega o id do cliente
    ${user_id}=         Convert To String    ${resp.json()['id']}
    
    # Muda a massa para novo nome
    Set To Dictionary    ${payload}    name    Cid Shadow
    
    # Solicita a alteração na API
    ${resp}    Put Customer    ${payload}    ${user_id}
    
    Status Should Be    204    ${resp}

    # Obtem os dados do cliente para validar se o nome foi alterado
    ${resp}    Get Unique Customer    ${user_id}

    Should Be Equal    ${resp.json()['name']}  Cid Shadow