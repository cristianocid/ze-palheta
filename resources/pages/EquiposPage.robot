***Settings***
Documentation       Representação da página equipamentos com seus elementos e ações

***Variables***
${EQUIPOS_FORM}             css:a[href$=register]
${LABEL_EQUIPO}             css:label[for=equipo-name]        
${LABEL_PRICE}              css:label[for=daily_price]
${BUTTON_CADASTRAR}         xpath://button[text()="CADASTRAR"]

***Keywords***
Register New Equipo
    [Arguments]     ${equipo-name}     ${daily_price}

    Input Text      id:equipo-name             ${equipo-name}
    Input Text      id:daily_price             ${daily_price}

    Click Element   ${BUTTON_CADASTRAR} 