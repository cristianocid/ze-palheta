***Settings***
Documentation       Representação da página contratos de alugueis com seus elementos e ações

***Variables***
${CONTRACTS_FORM}       css:a[href$=register]

***Keywords***
Create a new Contract
    [Arguments]     ${customer_name}    ${equipo_name}

    Click Element   xpath://div[contains(text(), 'Escolha o locatário')]
    Click Element   xpath://div[contains(text(), '${customer_name}')]

    Click Element   xpath://div[contains(text(), 'Escolha o item')]
    Click Element   xpath://div[contains(text(), '${equipo_name}')]

    Input text      id:delivery_price       10
    Input text      id:quantity             1

    Click Element   css:button[type=submit]
    Click Element   xpath://button[text()='CADASTRAR']