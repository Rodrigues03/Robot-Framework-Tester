
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome     Rodrigues
    Should Be Equal     ${result}       Olá Rodrigues, bem vindo ao Curso básico de Robot Framework!
