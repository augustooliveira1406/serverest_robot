*** Settings ***
Documentation     Página com as Keywords de Criação de usuarios via API

## #####################################################################
## Criado por: Augusto Oliveira                                       ##
## ......Data: 29/01/2025                                             ##
## ......Área: Quality Automation                                     ##
## #####################################################################

Resource    ../base.robot

*** Keywords ***
Dado que eu acessse o Swaagger ServeReest e liste todos os usuarios
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True 
    ${headers}=    Create Dictionary    Authorization=
    ${resp}=    GET On Session   httpbin    ${BASE_URL}${list_users}    headers=${headers}

    Should Be True    '${resp.status_code}'=='200'
    ${json}=           Set Variable           ${resp.json()}    
    ${quant}=        Get From Dictionary    ${json}       quantidade
    
    Set Suite Variable    ${quant}        ${quant}
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Listando a quantidade de Usuários da Plataforma
    Log To Console  ==============================================================================
    Log To Console  \n...Total de Usuários: ${quant}
    
E ppreencha os dados para criação de novo usuário
    ${num}=    Evaluate    random.randint(1, 100)    modules=random
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True 
    ${headers}=    Create Dictionary    Authorization=
    ${payload}=    Create Dictionary
    ...    nome=admin${num}
    ...    email=usuario_${num}@qa.com
    ...    password=123456
    ...    administrador=true
    ${resp}=    POST On Session   httpbin    ${BASE_URL}${cad_users}    json=${payload}    headers=${headers}

    Should Be True    '${resp.status_code}'=='201'
    ${json}=           Set Variable           ${resp.json()}    
    ${ID}=      Get From Dictionary    ${json}       _id
    Set Suite Variable    ${ID}    ${ID}
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário criado com sucesso!!!
    Log To Console  ==============================================================================
    Log To Console  \n...Usuário criado com Sucesso com o ID: ${ID}  

Quando alterar os dados do usuário criado
    Listar Usuario pelo ID
    ${num}=    Evaluate    random.randint(1, 100)    modules=random
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True 
    ${headers}=    Create Dictionary    Authorization=
    ${payload}=    Create Dictionary
    ...    nome=new_${nome}
    ...    email=new_${email}
    ...    password=new_${password}
    ...    administrador=true
    ${resp}=    PUT On Session   httpbin    ${BASE_URL}${list_users}/${ID}    json=${payload}     headers=${headers}

    Should Be True    '${resp.status_code}'=='200'
    ${json}=           Set Variable           ${resp.json()}    
    ${message}=        Get From Dictionary    ${json}       message
    
    Set Suite Variable    ${message}        ${message}
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Alteração de Usuário com sucesso!!!
    Log To Console  ==============================================================================
    Log To Console  \n..Mensagem: ${message}

Então será possível realizar login com os novos dados
    Listar Usuario pelo ID
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True 
    ${headers}=    Create Dictionary    Authorization=
    ${payload}=    Create Dictionary   
    ...    email=${email}
    ...    password=${password}
  
    ${resp}=    POST On Session   httpbin    ${BASE_URL}${login}    json=${payload}    headers=${headers}

    Should Be True    '${resp.status_code}'=='200'
    ${json}=           Set Variable           ${resp.json()}    
    ${mensagem}=    Get From Dictionary    ${json}       message
    ${token}=       Get From Dictionary    ${json}       authorization
    
    Set Suite Variable    ${mensagem}    ${mensagem}
    Set Suite variable    ${token}       ${token}

    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Usuário logado com sucesso!!!
    Log To Console  ==============================================================================
    Log To Console  \n...Mensagem: ${mensagem}
    Log To Console  ......Token: ${token}\n

Listar Usuario pelo ID
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True 
    ${headers}=    Create Dictionary    Authorization=
    ${resp}=    GET On Session   httpbin    ${BASE_URL}${list_users}/${ID}    headers=${headers}

    Should Be True    '${resp.status_code}'=='200'
    ${json}=           Set Variable           ${resp.json()}    
    ${nome}=        Get From Dictionary    ${json}       nome
    ${email}=       Get From Dictionary    ${json}       email
    ${password}=    Get From Dictionary    ${json}       password
    ${id}=          Get From Dictionary    ${json}       _id
    
    Set Suite Variable    ${nome}        ${nome}
    Set Suite Variable    ${email}       ${email}
    Set Suite Variable    ${password}    ${password}
    Set Suite Variable    ${id}          ${id}
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Listando Usuário criado pelo ID!!!
    Log To Console  ==============================================================================    
    Log To Console  \n..Usuário: ${nome}
    Log To Console  ...Email: ${email}
    Log To Console  Password: ${password}
    Log To Console  ......ID: ${id}

Obter Token JWT  
    Create Session    httpbin    ${BASE_URL}    disable_warnings=True   
    &{data}=      Create Dictionary        grant_type=client_credentials   

    &{headers}=    Create Dictionary    Content-Type=application/json    
    ${resp}=       Post On Session      httpbin    ${BASE_URL}${login}    data=${body}    headers=${headers}    
    
    Should Be True    '${resp.status_code}'=='200'
    ${json}=           Set Variable           ${resp.json()}    
    ${TOKEN}=      Get From Dictionary    ${json}       access_token
    
    Set Suite Variable    ${TOKEN}    Bearer ${TOKEN}
   
