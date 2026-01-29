# 🚀 Automação de Testes de API -- Robot Framework \| ServeRest

Este projeto contém uma automação completa de testes para a API REST da
plataforma ServeRest, utilizando Robot Framework, com foco em qualidade,
cobertura funcional e integração contínua.

------------------------------------------------------------------------

## 📌 Objetivo

Garantir a qualidade dos endpoints responsáveis pelo gerenciamento de
usuários, validando:

-   Criação
-   Consulta
-   Atualização
-   Exclusão
-   Listagem

------------------------------------------------------------------------

## 🧱 Tecnologias Utilizadas

-   Python 3.9+
-   Robot Framework
-   RequestsLibrary
-   JSONLibrary
-   GitHub Actions

------------------------------------------------------------------------

## 📁 Estrutura do Projeto

robot-api-tests/

-   features/
-   resources/
-   .github/workflows/
-   requirements.txt
-   README.md

------------------------------------------------------------------------

## ⚙️ Pré-requisitos

-   Python 3.9+
-   pip
-   Git

------------------------------------------------------------------------

## 🔧 Configuração do Ambiente

### Clone do repositório

git clone https://github.com/SEU_USUARIO/serverest_robot.git

cd serverest_robot

### Criar ambiente virtual

python3 -m venv venv

source venv/bin/activate

### Instalar dependências

pip install -r requirements.txt

------------------------------------------------------------------------

## 🔐 Autenticação

A API utiliza autenticação JWT obtida via endpoint:

POST /login

O token é gerenciado automaticamente pelos testes.

------------------------------------------------------------------------

## ▶️ Execução dos Testes

robot -d reports features/

------------------------------------------------------------------------

## 📊 Relatórios

Gerados na pasta:

reports/

-   log.html
-   report.html
-   output.xml

------------------------------------------------------------------------

## 🧪 Casos de Teste Implementados

### POST /users

-   Criar usuário válido
-   Validar campos obrigatórios

### GET /users

-   Listar usuários

### GET /users/{id}

-   Consultar usuário existente

### PUT /users/{id}

-   Atualizar dados

### DELETE /users/{id}

-   Excluir usuário

------------------------------------------------------------------------

## 📈 Cobertura

-   Fluxos positivos
-   Autenticação
-   Status code
-   Regras de negócio

------------------------------------------------------------------------

## 🔄 Integração Contínua

Pipeline configurada com GitHub Actions.

Executa automaticamente em push e pull request.

------------------------------------------------------------------------

## 📦 Artefatos

-   log.html
-   report.html
-   output.xml

Disponíveis na aba Actions.

------------------------------------------------------------------------

## 👨‍💻 Autor

Augusto Oliveira\
Analista de Qualidade de Software

------------------------------------------------------------------------

## ✅ Conclusão

Projeto desenvolvido para demonstrar boas práticas em automação de
testes, integração contínua e garantia da qualidade.
