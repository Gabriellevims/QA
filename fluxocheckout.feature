Feature: Checkout no Automation Exercise

Background:
  Given que estou logado com email "teste@teste.com" e senha "12345"
  And adicionei os produtos:
    | Product      |
    | Blue Top     |
    | Men Tshirt   |

# --- FLUXO PRINCIPAL ---
Scenario: Finalizar compra com cartão de crédito
  When clico em "Proceed To Checkout"
  Then vejo a página de revisão do pedido com:
    | Elemento               |
    | Product Name: Blue Top |
    | Price: Rs. 500         |
  When clico em "Place Order"
  Then sou redirecionado para "/payment"
  And preencho no formulário:
    | Campo          | Valor            |
    | Name on Card   | TESTE SILVA      |
    | Card Number    | 4111111111111111 |
    | CVC            | 123              |
    | Expiry Month   | 12               |
    | Expiry Year    | 2025             |
  When clico em "Pay and Confirm Order"
  Then vejo "Congratulations! Your order has been confirmed!"
  And recebo um order ID no formato "Your order #123456 has been placed"

# --- MÉTODOS DE PAGAMENTO ---
Scenario: Tentar finalizar sem selecionar pagamento
  Given estou na página "/payment"
  When clico em "Pay and Confirm Order" sem preencher dados
  Then vejo o alerta "Please fill out all fields"

# --- VALIDAÇÕES ---
Scenario: Campos obrigatórios no cadastro
  Given estou na página "/checkout"
  When deixo campos vazios e clico em "Place Order"
  Then vejo os erros:
    - "Please fill out Name on Card"
    - "Please fill out Card Number"
    - "Please fill out CVC"
    - "Please select Expiry Month/Year"

