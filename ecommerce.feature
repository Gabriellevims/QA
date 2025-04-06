Feature: Funcionalidades de e-commerce no site Automation Exercise

  # ---------------------------------------
  # 1. Busca de produtos
  # ---------------------------------------

  Scenario: Buscar um produto existente na barra de busca
    Given: que estou na página inicial do site Automation Exercise
    When: digito "Shirt" ou outros na barra de busca
    And: clico no botão de busca
    Then: devo ver resultados de produtos relacionados a "Shirt"

  Scenario: Buscar um produto inexistente
    Given: que estou na página inicial do site Automation Exercise
    When: digito "ProdutoQueNaoExiste123" na barra de busca
    And: clico no botão de busca
    Then: Não vejo nada

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
    Given: que apliquei o filtro "Woman, Kids ou Men"
    When: volto para a página principal de produtos
    Then: não devo ver mais o filtro "Woman, Kids ou Men" aplicado

  # ---------------------------------------
  # 3. Ordenação de produtos
  # ---------------------------------------

  Scenario: Ordenar produtos por preço
    Given: A Funcionalidade [ Ordenar produtos por preço ] não está disponível
    And: A equipe de desenvolvimento deve implementar a ação [ Ordenar produtos por preço ] para uma melhor análise de qualidade

  Scenario: Ordenar produtos por melhores avaliações
    Given: A Funcionalidade [ Ordenar produtos por avaliação ] não está disponível
    And: A equipe de desenvolvimento deve implementar a ação [ Ordenar produtos por avaliação ] para uma melhor análise de qualidade

  # ---------------------------------------
  # 4. Produtos relacionados
  # ---------------------------------------

  Scenario: Exibir produtos relacionados ao visualizar um item
    Given: que estou visualizando o produto "Blue Top"
    When: A funcionalidade de ver [ Itens recomendados ] não está disponível
    And: A equipe de desenvolvimento deve implementar a ação [ Itens recomendados ] para uma melhor análise de qualidade

  # ---------------------------------------
  # 5. Verificação da interface de produtos
  # ---------------------------------------

  Scenario: Verificar exibição de informações básicas do produto
    Given: que estou visualizando resultados de busca
    When: busco por um produto, como "Shirt"
    Then: cada produto deve mostrar nome, preço e botão "Add to cart"
