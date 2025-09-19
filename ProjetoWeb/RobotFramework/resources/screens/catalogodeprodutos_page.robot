*** Settings ***
Documentation     Page Inspector da Tela de Catálogo de Produtos

Resource    ../base.robot
Resource    ../hooks.robot

*** Variables ***
### Catálogo de Produtos
${MENU_WOMEN}                      css=a[title="Women"]
${MENU_DRESSES}                    xpath=(//a[@title='Dresses'][normalize-space()='Dresses'])[2]
${MENU_T-SHIRTS}                   xpath=(//a[@title='T-shirts'][normalize-space()='T-shirts'])[2]
${MENU_BLOG}                       xpath=(//a[normalize-space()='Blog'])[1]
${INPUT_PESQUISA}                  xpath=(//input[@id='search_query_top'])[1]
${BOTAO_PESQUISA}                  xpath=(//button[@name='submit_search'])[1]
${PRODUTO}                         xpath=(//span[@class='out-of-stock'])[1]
${BOTAO_SOBREUMPRODUTOT-SHIRTS}    css=a.button.lnk_view
${VISUALIZACAO_PRODUTO}            xpath=(//a[normalize-space()='Print'])[1]
${BOTAO_SOBREUMPRODUTODRESS}       xpath=(//a[@title='Printed Summer Dress'][normalize-space()='Printed Summer Dress'])[2]
${BOTAO_SELECAOTAMANHO}            xpath=(//select[@id='group_1'])[1]
${BOTAO_SELECAOTAMANHOM}           id=group_1
${BOTAO_DATASHEET}                 xpath=(//h3[normalize-space()='Data sheet'])[1]
${BOTAO_ADICIONARQUANTIDADE}       id=quantity_wanted

### Catálogo de Produtos -> ADICIONAR AO CARRINHO
${BOTAO_ADICIONARCARRINHO}         xpath=//button[@name="Submit"]/span[text()="Add to cart"]
${BOTAO_CONTINUAR_CHECKOUT}        xpath=(//span[normalize-space()='Proceed to checkout'])[1]
${BOTAO_CONTINUAR_CHECKOUT1}       xpath=(//a[@title="Proceed to checkout"])[2]
${BOTAO_EXCLUIRCARRINHO}           xpath=(//i[@class='icon-trash'])[1]
${FEEDBACK_EXCLUIRCARRINHO}        xpath=//p[contains(text(),'Your shopping cart is empty.')]
${TEXTO_NEWSLETTER}                xpath=(//h4[normalize-space()='Newsletter'])[1]
${BOTAO_SAVE_ENDERECO}             xpath=//button[@id='submitAddress']
${PRODUTO_NAME}                    Printed Summer Dress
${PRECOUNITARIO}                   xpath=//tr[.//a[contains(normalize-space(.),'${PRODUTO_NAME}')]]//td[contains(@class,'cart_unit')]//span[contains(@class,'price')]
${QUANTIDADEPRODUTO}               xpath=//tr[.//a[contains(normalize-space(.),'${PRODUTO_NAME}')]]//input[contains(@class,'cart_quantity_input')]
${SUBTOTAL}                        id=total_product
${FRETE}                           id=total_shipping
${TOTAL}                           id=total_price
${subtotal_norm}
${TOTAL_PRODUCT}