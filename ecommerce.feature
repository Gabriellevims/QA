Feature: Funcionalidades de e-commerce no site Automation Exercise

  # ---------------------------------------
  # 1. Busca de produtos
  # ---------------------------------------

  Scenario: Buscar um produto existente na barra de busca
    Given: que estou na página inicial do site Automation Exercise
    When: digito "Dress, Shirt or Top" ou outros na barra de busca
    And: clico no botão de busca
    Then: devo ver resultados de produtos relacionados a "Dress"

  Scenario: Buscar um produto inexistente
    Given: que estou na página inicial do site Automation Exercise
    When: digito "ProdutoQueNaoExiste123" na barra de busca
    And: clico no botão de busca
    Then: devo ver a mensagem "No products found"

  # ---------------------------------------
  # 2. Filtros por categoria
  # ---------------------------------------

  Scenario: Filtrar produtos da categoria "Women"
    Given: que estou na página inicial do site Automation Exercise
    When: clico na categoria "Women" no menu lateral
    Then: devo ver apenas produtos da categoria "Women"

  Scenario: Filtrar produtos da categoria "Men"
    Given: que estou na página inicial do site Automation Exercise
    When: clico na categoria "Men" no menu lateral
    Then:devo ver apenas produtos da categoria "Men"

  Scenario: Filtrar produtos da categoria "Kids"
    Given: que estou na página inicial do site Automation Exercise
    When: clico na categoria "Kids" no menu lateral
    Then:devo ver apenas produtos da categoria "Kids"

  Scenario: Voltar para página de produtos limpa após usar filtro
    Given: que apliquei o filtro "Kids"
    When: volto para a página principal de produtos
    Then: não devo ver mais o filtro "Kids" aplicado

  # ---------------------------------------
  # 3. Ordenação de produtos
  # ---------------------------------------

  Scenario: Ordenar produtos por preço do menor para o maior
    Given: que estou na página de produtos
    When: seleciono a opção "Preço: menor para maior"
    Then: os produtos devem ser exibidos em ordem crescente de preço

  Scenario: Ordenar produtos por melhores avaliações
    Given: que estou na página de produtos
    When: seleciono a opção "Melhores avaliações"
    Then: os produtos devem ser exibidos da melhor para a pior avaliação

  Scenario: Filtrar por categoria "Men" e ordenar por preço
    Given: que estou na página de produtos
    When: clico na categoria "Men"
    And: seleciono a opção "Preço: menor para maior"
    Then: devo ver produtos da categoria "Men" em ordem crescente de preço

  # ---------------------------------------
  # 4. Produtos relacionados
  # ---------------------------------------

  Scenario: Exibir produtos relacionados ao visualizar um item
    Given: que estou visualizando o produto "Blue Top"
    Then: devo ver a seção "Recommended Items"
    And: essa seção deve conter produtos relacionados ao "Blue Top"

  Scenario: Clicar em um produto relacionado
    Given: que estou visualizando o produto "Blue Top"
    When: clico em um dos produtos em "Recommended Items"
    Then: devo ser redirecionado para a página do produto selecionado

  # ---------------------------------------
  # 5. Verificação da interface de produtos
  # ---------------------------------------

  Scenario: Verificar exibição de informações básicas do produto
    Given: que estou visualizando resultados de busca
    When: busco por um produto, como "Shirt"
    Then: cada produto deve mostrar nome, preço e botão "Add to cart"