*** Settings ***

Resource    ../../../resources/services.robot
Resource    ../../../resources/fixtures/customers/list.json

*** Test Cases ***
Delete Customer
    ${origin}=    Get Json    chinbinha.json

    Delete Customer     ${origin['cpf']}
    ${resp}=      Post Customer    ${origin}

    ${resp}=      Delete Customer    ${origin['cpf']}

    Status Should Be    204                      ${resp}

Customer Not Found
    ${resp}    Delete Customer    333.354.351-31

    Status Should Be    404                          ${resp}
    Should Be Equal     ${resp.json()['message']}    Customer not found