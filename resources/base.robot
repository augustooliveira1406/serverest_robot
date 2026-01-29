## ####################################################################
##      Arquivos e Configurações utilizadas em todo o Projeto        ##
##                                                                   ##
## Criado por: Augusto Oliveira                                      ##
## ......Data: 29/01/2025                                            ##
## ......Área: Quality Automation                                    ##
## ####################################################################

*** Variables ***
## ####################################################################
##                                                                   ##
##                 Configuração de Ambiente                          ##
##                                                                   ##
## ####################################################################

*** Settings ***

## #####################################################################
##                                                                    ##
##                    Libraries de todo o projeto                     ##
##                                                                    ##
## #####################################################################

Library         Collections
Library         DateTime
Library         FakerLibrary    locale=pt_BR
Library         JSONLibrary
Library         OperatingSystem
Library         Process
Library         RequestsLibrary
Library         random
Library         SeleniumLibrary
Library         Screenshot
Library         String


## #####################################################################
##                             Hooks                                  ##
## #####################################################################
Resource    hooks.robot

## #####################################################################
##                         Keywords Web Service                       ##
## #####################################################################
Resource    keywords/kws_users_tests_api.robot
