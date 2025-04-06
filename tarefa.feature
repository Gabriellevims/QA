Feature: Gerenciamento de Perfil e Pedidos no Automation Exercise

   Scenario: Adicionar um produto ao carrinho
    Given o usuário está logado no site Automation Exercise
    When ele visualiza a página com as informações do produto
    And adiciona o produto desejado ao carrinho
   Then O produto deve ser adicionado ao carrinho

   Scenario: Fazer login no site
    Given o usuário está na página de login do site Automation Exercise
    When ele insere um e-mail e senha válidos
    And clica no botão de login
    Then ele deve ser redirecionado para a página principal com 
    a mensagem "Logged in as [nome do usuário]"

 Scenario: Compra de um produto
    Given o usuário está logado no site Automation Exercise
    And está na página de um produto disponível
    When ele clica no botão "Add to cart"
    And acessa o carrinho de compras
    And finaliza a compra com as informações de pagamento e envio
    Then a mensagem de confirmação da compra deve ser exibida
   
 Scenario: Pesquisa de um produto
    Given o usuário está na página principal do site Automation Exercise
    When ele digita o nome de um produto no campo de busca
    And clica no botão de pesquisa
    Then a lista de resultados deve exibir produtos relacionados ao termo pesquisado
