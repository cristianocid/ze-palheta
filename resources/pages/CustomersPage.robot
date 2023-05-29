*** Settings ***
Documentation    Representação da página clientes com seus elementos e ações

Resource         ../base.robot

*** Variables ***
${CUSTOMERS_FORM}   css:a[href$=register]

${LABEL_NAME}       css:label[for=name]
${LABEL_CPF}        css:label[for=cpf]
${LABEL_ADDRESS}    css:label[for=address]
${LABEL_PHONE}      css:label[for=phone_number]
${CUSTOMER_LIST}    css:table
*** Keywords ***
Register New Customer
    [Arguments]    ${name}    ${cpf}    ${address}    ${phone_number}   
    
    Input Text    id:name           ${name}
    Input Text    id:cpf            ${cpf}
    Input Text    id:address        ${address}
    Input Text    id:phone_number   ${phone_number}

    Click Element  xpath://button[text()='CADASTRAR']

Register New Customer Equipo
    [Arguments]    ${equipo_name}    ${daily_price}
    Input Text    id:equipo-name    ${equipo_name}
    Input Text    id:daily_price    ${daily_price}

    Click Element  xpath://button[text()='CADASTRAR']

Go To Customer Detatils
    [Arguments]    ${cpf_formatado}
    ${element}=    Set Variable    xpath://td[text()='${cpf_formatado}'] 

    Wait Until Element Is Visible    ${element}    3
    Click Element                    ${element}
    
Click Remove Customer
    ${element}=    Set Variable    xpath://button[text()='APAGAR']
    
    Wait Until Element Is Visible    ${element}    3
    Click Element                    ${element}
