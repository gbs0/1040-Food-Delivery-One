class MealsView
  def ask_for_name
    puts "The name of new meal?"
    print "> "
    gets.chomp 
  end

  def ask_for_price
    puts "The price of new meal?"
    print "> "
    gets.chomp.to_i
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}$"
    end
  end
end
