*** Settings ***
Documentation    Exclusão de clientes

Resource         ../resources/base.robot

Suite Setup       Login Session
Suite Teardown    Finish Session

*** Test Cases ***
Remover cliente
#Novos cliente
    [Tags]    remover
  Dado que tenho um cliente indesejado:
  ...    Bob Dylan    44444444444    Rua dos Bugs, 2000    21999999999
  E acesso a lista de clientes
  Quando eu removo esse cliente
  Então devo ver a notificação:    Cliente removido com sucesso!
  E esse cliente não deve aparecer na lista