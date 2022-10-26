require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # 1. Pegar todas as customers do Repositório
    list = @customer_repository.all
    # 2. Listar a lista na view
    @view.display(list)
  end

  def add
    # 1. Perguntar o nome do cliente
    name = @view.ask_for_name
    # 2. Perguntar o endereço do cliente
    address = @view.ask_for_address
    # 3. Criar uma nova customer
    new_customer = Customer.new(name: name, address: address)
    # 4. Adicionar no Repositório
    @customer_repository.add(new_customer)
  end
end