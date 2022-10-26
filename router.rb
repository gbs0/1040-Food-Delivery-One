class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      action = ask_action
      dispatch_action(action)
    end
  end

  private

  def print_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "-------------------------"
    puts "3. Add a customer"
    puts "4. List available customers"
    puts "-------------------------"
    puts "9. Exit"
    print "\n"
  end

  def dispatch_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @running = false
    else puts "Wrong action"
    end
  end

  def ask_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end
end
