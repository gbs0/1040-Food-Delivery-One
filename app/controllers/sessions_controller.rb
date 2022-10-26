require_relative '../views/sessions_view'
require 'pry'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # 1. Perguntar o nome do usúario
    # 2. Perguntar a senha do usuário
    username = @view.ask_for_username
    password = @view.ask_for_password

    # 3. Procura no Repositório o usuário a partir do username
    employee = @employee_repository.find_by_username(username)
    binding.pry
    # 4.Verifica se a senha está correta
    # 5. Caso exista, mostra uma mensagem de boas vindas
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else # 6. Caso não exista, dar erro e pedir novamente o login
      @view.wrong_credentials
      sign_in
    end
  end
end