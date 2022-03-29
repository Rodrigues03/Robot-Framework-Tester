*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    Xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_thor}
    checkbox Should Be Selected     ${check_thor} 

Marcando opção com CSS Selector
        Go To                           ${url}/checkboxes
        Select Checkbox                 ${check_iron}
        checkbox Should Be Selected     css:input[value='iron-man'] 

Marcando opção com Xpath
        [Tags]      ironman
        Go To                           ${url}/checkboxes
        Select Checkbox                 ${check_panther}
        checkbox Should Be Selected     ${check_panther}
  




