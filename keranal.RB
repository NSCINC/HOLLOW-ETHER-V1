class LoginSecurityKernel
  @@loggedInUsers = {}
  MAX_PARTICIPANTS_PER_UNIT = 7
  MAX_UNITS = 300

  def self.login(username, password)
    # Lógica de autenticação
    isAuthenticated = authenticate_user(username, password)

    # Se autenticado com sucesso, registra o usuário logado
    if isAuthenticated
      @@loggedInUsers[username] = @@loggedInUsers[username].to_i + 1
    end

    isAuthenticated
  end

  def self.logout(username)
    # Remove o usuário da lista de usuários logados ao fazer logout
    if @@loggedInUsers.key?(username)
      @@loggedInUsers[username] -= 1
      @@loggedInUsers.delete(username) if @@loggedInUsers[username] == 0
      true
    else
      false
    end
  end

  def self.token_closed?
    # Verifica se o número de unidades ativas é menor ou igual a 300
    @@loggedInUsers.length <= MAX_UNITS
  end

  def self.can_join_unit(username)
    # Verifica se o número de participantes na unidade atual é menor que 7
    @@loggedInUsers[username].to_i < MAX_PARTICIPANTS_PER_UNIT
  end

  def self.authenticate_user(username, password)
    # Lógica de autenticação - a ser implementada de acordo com requisitos específicos
    true  # Simulação de autenticação bem-sucedida
  end
end

# Exemplo de uso do modelo de autenticação
username = "user123"
password = "password123"

if LoginSecurityKernel.login(username, password)
  puts "Login successful"
  if LoginSecurityKernel.can_join_unit(username)
    puts "User can join unit"
  else
    puts "Unit is full"
  end
else
  puts "Login failed"
end

# Simulação de logout
LoginSecurityKernel.logout(username)

# Verifica se o token está fechado
if LoginSecurityKernel.token_closed?
  puts "Token is closed"
else
  puts "Token is still open"
end
