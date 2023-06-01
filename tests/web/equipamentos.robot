*** Settings ***
Documentation    Cadastro de equipamentos

Resource           ../../resources/base.robot

Suite Setup        Login Session
Suite Teardown     Finish Session

*** Test Cases ***
Novo equipamento
    [Tags]    equipo
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento:
    ...        Guitarra    1
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação:    Equipo cadastrado com sucesso! 

Nome obrigatório
    [Tags]    required_name
    [Template]    Validação de Campos Equipos
    ${EMPTY}    1   Nome do equipo é obrigatório

Valor obrigatório
    [Tags]    required_daily
    [Template]    Validação de Campos Equipos
    Violão    ${EMPTY}    Diária do equipo é obrigatória

Equipamento duplicado
    [Tags]    equipo_duplicado
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento:
    ...        Guitarra    1
    Mas esse equipo já existe no sistema
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação de erro:    Erro na criação de um equipo 



*** Keywords ***
Validação de Campos Equipos
    [Arguments]    ${equipo_name}    ${daily_price}    ${saida}
    
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento:
        ...     ${equipo_name}     ${daily_price}
    Quando faço a inclusão desse equipamento
    Então devo ver o texto:    ${saida}
