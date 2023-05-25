*** Settings ***
Resource   ../resources/base.robot

*** Keywords ***
# Keywords Login
Acesso a página Login
    Go To    ${base_url} 
    
Submeto minhas credenciais
    [Arguments]    ${email}    ${password}

    Login With    ${email}    ${password}
    
Devo ver a área logada
    Wait Until Page Contains    Aluguéis   3

Devo ver um toaster com a mensagem
    [Arguments]    ${expect_message} 

    Wait Until Element Contains    ${TOASTER_ERROR}    ${expect_message}


# Keywords Customers
Dado que acesso o formulário de cadastro de clientes
    Wait Until Element Is Visible    ${NAV_CUSTOMERS}      5
    Click Element                    ${NAV_CUSTOMERS}  
    Wait Until Element Is Visible    ${CUSTOMERS_FORM}     5  
    Click Element                    ${CUSTOMERS_FORM}    

Quando faço a inclusão desse cliente:
    [Arguments]    ${name}    ${cpf}    ${address}    ${phone_number}   
    
    remove_customer_by_cpf    ${cpf}

    Register New Customer    ${name}    ${cpf}    ${address}    ${phone_number}    

Então devo ver a notificação:
    [Arguments]    ${expect_notice}
    Wait Until Element Contains    ${TOASTER_SUCCESS}    ${expect_notice}    5

Então devo ver mensagens informando que os campos do cadastro de clientes são Obrigatórios
    Wait Until Page Contains    Nome é obrigatório        3
    Wait Until Page Contains    CPF é obrigatório         3
    Wait Until Page Contains    Endereço é obrigatório    3
    Wait Until Page Contains    Telefone é obrigatório    3

Então devo ver o texto:
    [Arguments]    ${expect_text}
    
    Wait Until Page Contains    ${expect_text}    3

