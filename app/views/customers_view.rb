class CustomersView
  def ask_for_name
    puts "Full Name of new customer?"
    print "> "
    gets.chomp
  end

  def ask_for_address
    puts "Address of new customer?"
    print "> "
    gets.chomp.to_i
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end
end
