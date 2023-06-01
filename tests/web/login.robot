*** Settings ***
Documentation       Login

Resource   ../../resources/base.robot

# executa um ou mais Keywords antes da execução de todos os steps de cada caso de teste
Suite Setup       Start Session
# executa uma ou mais Keywords após a execução de todos os steps de cada caso de teste
Suite Teardown    Finish Session

*** Test Cases ***
Login do Administrador
    [tags]    smoke
    Acesso a página Login
    Submeto minhas credenciais    admin@zepalheta.com.br    pwd123
    Devo ver a área logada
