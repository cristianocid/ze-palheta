*** Settings ***
Documentation    Representação do menu lateral de navegação da área logada

Resource    ../base.robot

*** Variables ***
${NAV_CUSTOMERS}            css:a[href$=customers]
${NAV_CUSTOMERS_EQUIPOS}    css:a[href$=equipos]

*** Keywords ***
Go To Customers
    Wait Until Element Is Visible    ${NAV_CUSTOMERS}      5
    Click Element                    ${NAV_CUSTOMERS}



