require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv)
    @csv = csv
    @customers = []
    @next_id = 1
    load_csv if File.exists?(@csv)
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv, 'w') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : (@customers.last.id + 1)
  end
end