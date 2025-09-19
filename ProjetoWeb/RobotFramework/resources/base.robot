*** Variables ***
#######################################################################
##                                                                   ##
##                 Configuração de Ambiente                          ##
##                                                                   ##
## ####################################################################

*** Settings ***

########################################################################
##                                                                    ##
##                    Libraries de todo o projeto                     ##
##                                                                    ##
## #####################################################################

Library    SeleniumLibrary
Library    String

########################################################
#                        Hooks                         #
########################################################
Resource    hooks.robot

########################################################
#                      Pages Web                       #
########################################################
Resource   screens/autenticacao_page.robot
Resource   screens/catalogodeprodutos_page.robot

########################################################
#                      Keywords Web                    #
########################################################
Resource    keywords/kws_autenticacao.robot
Resource    keywords/kws_novaconta.robot
Resource    keywords/kws_catalogodeprodutos.robot

