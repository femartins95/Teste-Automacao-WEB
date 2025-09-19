*** Settings ***
Documentation     Página com as Keywords do site My Shop Catálogo de Produtos
 
Resource    ../base.robot
Resource    ../hooks.robot
 
*** Keywords ***
# Cenario 01: Validar quando estiver logado consigo navegar pelo catálogo de produtos
E realizar navegação do menu Women
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botões do menu para navegação 'Women'
    Log To Console  ============================================================================== 
    Capture Page Screenshot
    Wait Until Page Contains Element    ${MENU_WOMEN}                                           30
    Click Element   ${MENU_WOMEN} 
    Sleep    2
    Wait Until Page Contains    Women
    Capture Page Screenshot

E realizar navegação do menu Dresses
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botões do menu para navegação 'Dresses'
    Log To Console  ============================================================================== 
    Sleep    2
    Wait Until Page Contains Element    ${MENU_DRESSES}                                         30
    Click Element   ${MENU_DRESSES} 
    Click Element   ${MENU_DRESSES}     
    Sleep    2
    Wait Until Page Contains    Dresses
    Capture Page Screenshot
    Sleep    2

E realizar navegação do menu T-shirts
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botões do menu para navegação 'T-shirts'
    Log To Console  ============================================================================== 
    Wait Until Page Contains Element    ${MENU_T-SHIRTS}                                        30
    Click Element   ${MENU_T-SHIRTS}
    Sleep    2
    Wait Until Page Contains    T-shirts
    Capture Page Screenshot
    Sleep    2

Quando realizar navegação dos menu Blog
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando no botões do menu para navegação 'Blog'
    Log To Console  ============================================================================== 
    Wait Until Page Contains Element    ${MENU_BLOG}                                            30
    Click Element   ${MENU_BLOG}
    Sleep    2

Então realizar navegação dos menus 
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Validando navegação do menu 'Blog'
    Log To Console  ============================================================================== 
    Wait Until Page Contains    Blog
    Capture Page Screenshot

# Cenario 02: Validar quando estiver logado consigo fazer uma busca por produto e clicar para visualizar mais detalhes do produto
E realizar uma busca por produto inválido
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Realizando pesquisa por produto inválido
    Log To Console  ============================================================================== 
    Capture Page Screenshot
    Wait Until Page Contains Element    ${INPUT_PESQUISA}                                       30
    SeleniumLibrary.Input Text          ${INPUT_PESQUISA}     Teste@teste123456789.000  
    Capture Page Screenshot
    Wait Until Page Contains Element    ${BOTAO_PESQUISA}                                       30
    Click Element   ${BOTAO_PESQUISA}
    Capture Page Screenshot
    Sleep    5

Quando realizar uma busca por produto valido
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Realizando pesquisa por produto valido
    Log To Console  ============================================================================== 
    Capture Page Screenshot
    Wait Until Page Contains Element    ${INPUT_PESQUISA}                                       30
    SeleniumLibrary.Input Text          ${INPUT_PESQUISA}     t-shirt  
    Capture Page Screenshot
    Sleep    2
    Wait Until Page Contains Element    ${BOTAO_PESQUISA}                                       30
    Click Element   ${BOTAO_PESQUISA}
    Capture Page Screenshot

Então usuário consegue visualizar o produto pesquisado
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Valido produto pesquisado
    Log To Console  ============================================================================== 
    Scroll Element Into View            ${PRODUTO}
    Capture Page Screenshot

E clico sobre o produto pesquisado
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando sobre o produto pesquisado para visualizar mais detalhes
    Log To Console  ============================================================================== 
    Wait Until Page Contains Element    ${BOTAO_SOBREUMPRODUTOT-SHIRTS}                         30
    Click Element   ${BOTAO_SOBREUMPRODUTOT-SHIRTS}
    Capture Page Screenshot
    Scroll Element Into View            ${VISUALIZACAO_PRODUTO}
    Capture Page Screenshot

# Cenario 03: Validar quando estiver logado consigo selecionar um produto ao carrinho
 E clicar sobre o produto que quero comprar
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando sobre o produto pesquisado para visualizar mais detalhes
    Log To Console  ============================================================================== 
    Scroll Element Into View            ${BOTAO_SOBREUMPRODUTODRESS}
    Wait Until Element Is Visible       ${BOTAO_SOBREUMPRODUTODRESS}                            30
    Click Element   ${BOTAO_SOBREUMPRODUTODRESS}  
    Capture Page Screenshot

E seleciono o tamanho do produto que quero comprar
    # [Arguments]    ${tamanho}=M
    Log To Console    \n
    Log To Console    ==============================================================================
    Log To Console    Selecionando tamanho do produto
    Log To Console    ==============================================================================
    Scroll Element Into View          ${BOTAO_DATASHEET}
    Select From List By Label         ${BOTAO_SELECAOTAMANHOM}    M
    Capture Page Screenshot
    SeleniumLibrary.Input Text        ${BOTAO_ADICIONARQUANTIDADE}     10

Quando clicar no botão 'Add to cart'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Adicionando o produto ao carrinho
    Log To Console  ============================================================================== 
    Scroll Element Into View            ${BOTAO_ADICIONARCARRINHO}
    Wait Until Page Contains Element    ${BOTAO_ADICIONARCARRINHO}                              30
    Click Element   ${BOTAO_ADICIONARCARRINHO} 
    Sleep    5
    Capture Page Screenshot  

Então usuário consegue adicionar o produto ao carrinho
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Produto adicionando com sucesso ao carrinho
    Log To Console  ============================================================================== 
    Wait Until Page Contains Element    ${BOTAO_ADICIONARCARRINHO}                              30
    Sleep    5
    Capture Page Screenshot  

E clicar no botão 'lixeira'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando para continuar com a compra e excluindo produto do carrinho
    Log To Console  ============================================================================== 
    Click Element   ${BOTAO_CONTINUAR_CHECKOUT} 
    Capture Page Screenshot 
    Scroll Element Into View            ${TEXTO_NEWSLETTER}
    Wait Until Page Contains Element    ${BOTAO_EXCLUIRCARRINHO}                                30
    Sleep    2
    Capture Page Screenshot  
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  FEEDBACK DE PRODUTO EXCLUIDO DO CARRINHO COM SUCESSO
    Log To Console  ============================================================================== 
    Wait Until Page Contains Element    ${TEXTO_NEWSLETTER}                                     30
    Capture Page Screenshot  
 
# Cenario 04: Validar quando estiver logado após seleção de produto consigo saber o valor da compra e avançar para tela de endereço
E clicar no botão 'Proceed to checkout'
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Clicando para continuar com a compra
    Log To Console  ============================================================================== 
    Click Element                       ${BOTAO_CONTINUAR_CHECKOUT} 
    Scroll Element Into View            ${TEXTO_NEWSLETTER}
    Capture Page Screenshot

E estou no checkout consigo validar os cálculos do carrinho
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Validando valor final da compra no checkout
    Log To Console  ============================================================================== 
Validar cálculos do carrinho
    [Documentation]    Localiza valores do produto na linha do ${PRODUTO_NAME} e valida subtotal/total.
    # garantir estamos na tela de summary
    Wait Until Page Contains Element    ${TOTAL_PRODUCT}    20s

    # garantir que a linha do produto está visível
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${PRECOUNITARIO}    10s
    ${ok}=    Run Keyword And Return Status    Element Should Be Visible    ${PRECOUNITARIO}
    Run Keyword If    '${ok}' == 'False'    Capture Page Screenshot    failed_locating_price.png
    Run Keyword If    '${ok}' == 'False'    Fail    Preço unitário não encontrado com locator ${PRECOUNITARIO} - capture em failed_locating_price.png

    # pegar os textos
    ${preco_unitario}=    Get Text    ${PRECOUNITARIO}
    ${quantidade}=        Get Value   ${QUANTIDADEPRODUTO}
    ${subtotal}=          Get Text    ${SUBTOTAL}
    ${frete}=             Get Text    ${FRETE}
    ${total}=             Get Text    ${TOTAL} 

    Log To Console    Preço unitário raw: ${preco_unitario}
    Log To Console    Quantidade raw: ${quantidade}
    Log To Console    Subtotal raw: ${subtotal}
    Log To Console    Frete raw: ${frete}
    Log To Console    Total raw: ${total}

    # normalizar (remover $/R$, trocar ',' por '.')
    ${preco_norm}=    Evaluate    '${preco_unitario}'.replace('$','').replace('R$','').replace(',','.').strip()
    ${subtotal_norm}= Evaluate    '${subtotal}'.replace('$','').replace('R$','').replace(',','.').strip()
    ${frete_norm}=    Evaluate    '${frete}'.replace('$','').replace('R$','').replace(',','.').strip()
    ${total_norm}=    Evaluate    '${total}'.replace('$','').replace('R$','').replace(',','.').strip()

    # converter para números
    ${preco_num}=     Evaluate    float('${preco_norm}')
    ${qtd_num}=       Evaluate    int('${quantidade}')
    ${subtotal_num}=  Evaluate    float('${subtotal_norm}')
    ${frete_num}=     Evaluate    float('${frete_norm}')
    ${total_num}=     Evaluate    float('${total_norm}')

    # cálculos esperados (arredondar 2 casas)
    ${subtotal_esperado}=    Evaluate    round(${preco_num} * ${qtd_num}, 2)
    ${total_esperado}=       Evaluate    round(${subtotal_esperado} + ${frete_num}, 2)

    Log To Console    subtotal esperado: ${subtotal_esperado}
    Log To Console    total esperado: ${total_esperado}

    # validações com tolerância pequena
    Should Be Equal As Numbers    ${subtotal_num}    ${subtotal_esperado}    0.01
    Should Be Equal As Numbers    ${total_num}       ${total_esperado}       0.01

Então usuário consegue validar os cálculos do carrinho avançando para tela de endereço
    Log To Console  \n
    Log To Console  ==============================================================================
    Log To Console  Valor final da compra no checkout avançando para tela de endereço
    Log To Console  ============================================================================== 
    # Wait Until Page Contains Element      ${BOTAO_CONTINUAR_CHECKOUT} 
    Click Element                         ${BOTAO_CONTINUAR_CHECKOUT1}
    Scroll Element Into View              ${BOTAO_SAVE_ENDERECO}
    Wait Until Page Contains Element      ${BOTAO_SAVE_ENDERECO}                                30
    Sleep    2
    Capture Page Screenshot 