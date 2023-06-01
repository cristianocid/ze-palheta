*** Settings ***

Library    OperatingSystem


*** Keywords ***
Get Json
    [Arguments]    ${file_name}

    ${json_file}    Get File    ${EXECDIR}/resources/fixtures/customers/${file_name}
    ${json_dict}=   Evaluate    json.loads($json_file)    json

    [return]    ${json_dict}   