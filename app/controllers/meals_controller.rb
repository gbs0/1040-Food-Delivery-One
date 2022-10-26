require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # 1. Pegar todas as Meals do Repositório
    list = @meal_repository.all
    # 2. Listar a lista na view
    @view.display(list)
  end

  def add
    # 1. Perguntar o nome do prato
    name = @view.ask_for_name
    # 2. Perguntar o preço do prato
    price = @view.ask_for_price
    # 3. Criar uma nova Meal
    new_meal = Meal.new(name: name, price: price)
    # 4. Adicionar no Repositório
    @meal_repository.add(new_meal)
  end
end