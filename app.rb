require_relative "app/repositories/employee_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/sessions_controller"
require_relative "router"

employee_csv = "data/employees.csv"
employee_repository = EmployeeRepository.new(employee_csv)

customers_csv = "data/customers.csv"
customer_repository = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)

meals_csv = "data/meals.csv"
meal_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)

sessions_controller = SessionsController.new(employee_repository)

router = Router.new(sessions_controller, meals_controller, customers_controller)
router.run
