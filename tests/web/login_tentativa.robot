*** Settings ***
Documentation       Login Tentativa
Resource            ../../resources/base.robot

Test Template       Tentativa de login

# executa um ou mais Keywords somente uma vez antes da execução de todos os steps de cada caso de teste
Suite Setup       Start Session
# executa uma ou mais Keywords uma unica vez após a execução de todos os steps de cada caso de teste
Suite Teardown    Finish Session

*** Keywords ***
Tentativa de login
    [Arguments]    ${input_email}    ${input_senha}    ${output_mensagem}
    
    Acesso a página Login
    Submeto minhas credenciais    ${input_email}    ${input_senha}
    Devo ver um toaster com a mensagem    ${output_mensagem}        

*** Test Cases ***
Senha incorreta            admin@zepalheta.com.br    abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
Senha em branco            joao@gmail.com            ${EMPTY}    O campo senha é obrigatório!
Email em branco            ${EMPTY}                  123456      O campo email é obrigatório!
Email e senha em branco    ${EMPTY}                  ${EMPTY}    Os campos email e senha não foram preenchidos!
Login incorreto            admin@gmail.com           abc123      Ocorreu um erro ao fazer login, cheque as credenciais.