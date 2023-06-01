*** Settings ***

Resource    ../../../resources/services.robot
Resource    ../../../resources/fixtures/customers/list.json

*** Test Cases ***
Get Customer List
    ${list}=       Get Json    list.json

    FOR    ${item}    IN    @{list['data']}
        # O ${item} é o Payload
        Post Customer   ${item}
    END

    ${resp}=            Get Customers
    Status Should Be    200               ${resp}
    ${total}=           Get Length        ${resp.json()}
    Should Be True      ${total} > 0

Get Unique Customer
    ${origin}=    Get Json    unique.json

    Delete Customer     ${origin['cpf']}

    ${resp}=      Post Customer    ${origin}
    ${user_id}=   Convert To String    ${resp.json()['id']} 

    ${resp}=      Get Unique Customer    ${user_id}

    Status Should Be    200                      ${resp}
    Should Be Equal     ${resp.json()['cpf']}    ${origin['cpf']}

Customer Not Found
    ${resp}    Get Unique Customer    771f3e60-6921-44ec-af48-59ac375a11dd

    Status Should Be    404                          ${resp}
    Should Be Equal     ${resp.json()['message']}    Customer not found