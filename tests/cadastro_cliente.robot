*** Settings ***
Documentation    Cadastro de clientes

Resource         ../resources/base.robot

Suite Setup       Login Session
Suite Teardown    Finish Session

*** Test Cases ***
Novo cliente
#Novos cliente
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        Bon jovi    00000001406    Rua dos Bugs, 1000    11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:    Cliente cadastrado com sucesso! 

Cliente duplicado
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        Bon jovi    00000001406    Rua dos Bugs, 1000    11999999999
    Mas esse cpf já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:    Este CPF já existe no sistema! 

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}     ${EMPTY}     ${EMPTY}     ${EMPTY}
    Quando faço a inclusão desse cliente
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

Telefone incorreto
    [Template]    Validação de Campos
    Joao Junior    48034903094    Rua dos Bugs, 1000    118999999    Telefone inválido

*** Keywords ***
Validação de Campos
    [Arguments]    ${nome}    ${cpf}    ${endereco}    ${telefone}    ${saida}
    
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
        ...     ${nome}     ${cpf}    ${endereco}    ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto:    ${saida}
