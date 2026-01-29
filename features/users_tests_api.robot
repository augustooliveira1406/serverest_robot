*** Settings ***
Documentation     Fazer o CRUD na Api ServeRest

## #####################################################################
## Criado por: Augusto Oliveira                                       ##
## ......Data: 29/01/2025                                             ##
## ......Área: Quality Automation                                     ##
## #####################################################################

Resource    ../resources/base.robot

*** Test Cases ***
#robot -N "Testes em HML APP Digital" -d .logs -i Login ./features/login.robot
Cenario 01: Realizar o CRUD na API Servrest 
    [Tags]    
    Dado que eu acessse o Swaagger ServeReest e liste todos os usuarios
    E ppreencha os dados para criação de novo usuário
    Quando alterar os dados do usuário criado
    Então ser1a possível realizar login com os novos dados  

