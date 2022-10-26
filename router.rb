class Router
  def initialize(sessions_controller, meals_controller, customers_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.sign_in
    while @running
      @employee.manager? ? print_manager_menu : print_delivery_guy_menu
      action = ask_action
      @employee.manager? ? dispatch_manager_action(action) : dispatch_delivery_guy_action(action)
    end
  end

  private

  def print_manager_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "-------------------------"
    puts "3. Add a customer"
    puts "4. List available customers"
    puts "-------------------------"
    puts "9. Exit"
    print "\n"
  end

  def print_delivery_guy_menu
    puts "1. List my Orders"
    puts "2. Mark Order as Delivered"
    puts "9. Exit"
    print "\n"
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @running = false
    else puts "Wrong action"
    end
  end

  def dispatch_delivery_guy_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
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
