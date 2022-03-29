*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To           ${url}/login
    Login With      stark    jarvis!
    
    Should See Logged User  full_name        Tony Stark

Senha Invalida 
    [tags]          login_error
    Go To           stark       acb123
    
    Should Contain  ${message.text}                 Senha é invalida!

Usuario não existe
    [tags]          login_user404
    Go To           ${url}/login
    Login With      rod                          123456

    Should Contain  ${message.text}              O usuario informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]     ${uname}    ${pass}

    Input Text      css:input[name=username]        ${uname}
    Input Text      css:input[name=password]        ${pass}
    Click Element   class:btn-login

Should Contain Login Alert

        [Arguments]     ${expect_message}

        ${message}=     Get WebElement      id:flash
        Should Contain  ${message.text}     ${expect_message}

Should See Logged User
        [Arguments]         ${full_name}

        Page Should Contain         Olá, ${full_name}, Você acessou a área logada!


