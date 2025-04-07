### Título:  
**"Como novo usuário, quero me cadastrar no sistema com meus dados pessoais para poder realizar compras online"**  

Scenario: Cadastro completo com dados válidos  
  Given acesso à página de cadastro inicial  
  When preencho "Name" com "Gabriel"  
  And preencho "Email Address" com "gabriel@example.com"  
  And clico em "Signup"  
  Then sou redirecionado para a página de detalhes da conta  
  When seleciono o título "Mr."  
  And preencho "Password" com "Senha@1234"  
  And preencho "First name" com "Gabriel"  
  And preencho "Last name" com "Silva"  
  And preencho "Address" com "Rua ABC, 123"  
  And seleciono "Country" como "India"  
  And preencho "State" com "São Paulo"  
  And preencho "City" com "São Paulo"  
  And preencho "Zipcode" com "01234-567"  
  And preencho "Mobile Number" com "11999999999"  
  And clico em "Create Account"  
  Then a mensagem "Account Created!" é exibida  
  And sou redirecionado para a página inicial  

Scenario: E-mail duplicado  
  Given o e-mail "gabriel@existente.com" já está cadastrado  
  When preencho "Email Address" com "gabriel@existente.com"
  And preencho"name" com "levi"  
  And clico em "Signup"  
  Then a mensagem "Email Address already exists!" é exibida
