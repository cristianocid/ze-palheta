*** Settings ***
Documentation    Cadastro de clientes

Resource         ../resources/base.robot

Suite Setup       Login Session
Suite Teardown    Finish Session

*** Test Cases ***
Novo cliente
#Novos cliente
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...        Bon jovi    00000001406    Rua dos Bugs, 1000    11999999999
    Então devo ver a notificação:    Cliente cadastrado com sucesso! 

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${EMPTY}     ${EMPTY}     ${EMPTY}     ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são Obrigatórios

Nome é obrigatório
    [Tags]    required
    [Template]    Validação de Campos
    ${EMPTY}    48034903094    Rua dos Bugs, 1000     11999999999   Nome é obrigatório

CPF é obrigatório
    [Tags]    required
    [Template]    Validação de Campos
    Joao Junior    ${EMPTY}    Rua dos Bugs, 1000     11999999999   CPF é obrigatório

Endereço é obrigatório
    [Tags]    required
    [Template]    Validação de Campos
    Joao Junior    48034903094    ${EMPTY}     11999999999   Endereço é obrigatório

Telefone é obrigatório
    [Tags]    required
    [Template]    Validação de Campos
    Joao Junior    48034903094    Rua dos Bugs, 1000     ${EMPTY}   Telefone é obrigatório

*** Keywords ***
Validação de Campos
    [Arguments]    ${nome}    ${cpf}    ${endereco}    ${telefone}    ${saida}
    
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${nome}     ${cpf}    ${endereco}    ${telefone}
    Então devo ver o texto:    ${saida}




# Cenários (Fazer um teste para cada)
# Nome é obrigatório
# CPF é obirgatório
# Endereço é obrigatório
# Telefone é obrigatório

# Desafio do RoboCamp

# Implementar os cenários de campos obrigatórios usando a técnica do Test Template
