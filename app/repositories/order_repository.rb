require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv, meal_repository, employee_repository, customer_repository)
    @csv = csv
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @next_id = 1
    @orders = []
    load_csv if File.exists?(@csv)
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv, 'w') do |row|
      row << %w[id delivered meal_id employee_id customer_id]
      @orders.each do |order|
        row << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  def undelivered_orders
    @orders.select { |order| order.delivered? == false }
  end
  
  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:delivered] = row[:delivered] == "true"
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : (@orders.last.id + 1)
  end
end