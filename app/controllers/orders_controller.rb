require_relative '../repostories/meal_repository'
require_relative '../repostories/employee_repository'
require_relative '../repostories/customer_repository'

class OrdersController
  def initialize(order_repository, meal_repository, employee_repository, customer_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

end