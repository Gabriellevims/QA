Feature: Processo de Checkout e Pagamento no Automation Exercise

Background:
  Given que estou logado com o email "teste@exemplo.com" e senha "123456"
  And meu carrinho contém:
    | Produto       | Quantidade | Preço Unitário |
    | T-Shirt       | 2          | R$ 50,00       |
    | Jeans         | 1          | R$ 120,00      |

# ---- FLUXO PRINCIPAL ----
@positivo @checkout_completo
Scenario: Checkout completo com cartão de crédito válido
  When acesso a página de checkout
  And preencho meu endereço de entrega com:
    | Campo       | Valor            |
    | Nome        | João Silva       |
    | País        | Brazil           |
    | Endereço    | Rua ABC, 123     |
    | Cidade      | São Paulo        |
    | Estado      | SP               |
    | CEP         | 01311000         |
    | Celular     | 11999999999      |
  And seleciono o frete "Standard Shipping"
  Then sou redirecionado para a página "Payment"
  And a URL contém "/payment"
  When preencho os dados do cartão:
    | Campo          | Valor            |
    | Nome no Cartão | JOÃO SILVA       |
    | Número         | 4111111111111111 |
    | CVC            | 123              |
    | Validade       | 12/2025          |
  And confirmo o pagamento
  Then vejo a mensagem "Your order has been placed successfully!"
  And recebo um número de confirmação do pedido
  And o e-mail de confirmação contém:
    - Número do pedido
    - Resumo dos produtos
    - Valor total: R$ 220,00
    - Método: Cartão de Crédito

# ---- MÉTODOS DE PAGAMENTO ALTERNATIVOS ----
@pagamento @pix
Scenario: Pagamento via PIX com QR code válido
  Given que selecionei a opção de pagamento "PIX"
  When o sistema exibe o QR code para pagamento
  And realizo o pagamento via aplicativo do banco
  Then vejo a mensagem "Pagamento aprovado via PIX"
  And o status do pedido é atualizado para "Pago" em menos de 1 minuto

@pagamento @boleto
Scenario: Pagamento via boleto bancário
  Given que selecionei a opção de pagamento "Boleto Bancário"
  When o sistema gera o boleto com:
    | Campo         | Valor               |
    | Valor Total   | R$ 220,00           |
    | Vencimento    | 05/12/2023          |
    | Código        | 12345.67890.12345.678901 |
  Then consigo visualizar o boleto para impressão
  And recebo instruções por e-mail com o assunto "Seu boleto foi emitido"

@pagamento @paypal
Scenario: Pagamento via PayPal
  Given que selecionei "PayPal" como método
  When sou redirecionado para o site do PayPal
  Then consigo logar com "comprador@teste.com" e senha "teste123"
  And confirmo o pagamento no PayPal
  And sou redirecionado de volta para "/payment_done"

# ---- CENÁRIOS DE VALIDAÇÃO ----
@validacao @campos_obrigatorios
Scenario: Mensagens de erro em campos obrigatórios
  When deixo todos os campos do endereço em branco
  And clico em "Continue to Payment"
  Then vejo as mensagens:
    - "Name is required"
    - "Address is required"
    - "City is required"
    - "Zip Code is required"
    - "Mobile Number is required"

@validacao @frete
Scenario: Frete grátis para compras acima de R$ 300,00
  Given meu carrinho totaliza R$ 350,00
  When acesso a página de frete
  Then a opção "Free Shipping" está disponível
  And o valor do frete é R$ 0,00

# ---- CENÁRIOS DE EXCEÇÃO ----
@excecao @cartao_invalido
Scenario: Pagamento com cartão recusado
  When preencho os dados de um cartão inválido:
    | Campo          | Valor            |
    | Número         | 4000000000000002 |
    | Validade       | 12/2024          |
  And confirmo o pagamento
  Then vejo a mensagem "Your card was declined. Please try another payment method."
  And posso selecionar novo método de pagamento

@excecao @pix_expirado
Scenario: PIX não confirmado em 24h
  Given que gerei um QR code PIX há 25 horas
  When acesso meus pedidos
  Then o status é "Cancelado"
  And recebo um e-mail "Seu pagamento não foi confirmado"

# ---- CENÁRIOS COMPLEMENTARES ----
@cupom
Scenario: Aplicar cupom de desconto válido
  Given que insiro o cupom "OFF10"
  When aplico o desconto
  Then o subtotal é reduzido para R$ 198,00 (10% off)
  And vejo "Cupom aplicado com sucesso"

@mobile @responsivo
Scenario: Checkout via dispositivo móvel
  Given que acesso o site pelo celular
  Then os campos de endereço são otimizados para mobile
  And o botão "Finalizar Compra" é fixo no rodapé

@cancelamento
Scenario: Cancelar pedido após pagamento
  Given que realizei um pedido pago
  When acesso "Minhas Compras"
  And clico em "Cancelar Pedido"
  Then o status muda para "Canceled"
  And vejo a opção "Reembolsar para o cartão original"