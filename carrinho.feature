Feature: funcionalidades do carrinho de compras no site Automation Exercise


Adicionar produtos no carrinho

Scenario: adicionar um produto existente no carrinho 
Given: estou na página inicial do site Automation Exercise
When: adiciono um produto no carrinho
And: clico no carrinho
Then: devo ver o produto que foi adicionado no carrinho


2.atualizar Quantidade de itens no carrinho

Scenario: adicionar mais um produto ao carrinho
Given: estou na página inicial do site Automation Exercise
When: adicono mais um produto
And: clico no carrinho
Then: tem que estar atualizado com o produto que foi adicionado


Cálculo automático do valor total

Scenario: adicionar um produto existente no carrinho
Given: estou na página inicial do site Automation Exercise
When: adiciono mais de um produto no carrinho
And: clico no carrinho
Then: não vejo o valor total a ser pago, só o preço individual de cada produto


4.  Persistência do carrinho(ao usuário entrar e sair do site)

Scenario: entrar no carrinho
Given: estou na página inicial do site Automation Exercise
When: adiciono um produto no carrinho