require_relative '../models/employee'
require 'csv'

class EmployeeRepository
  def initialize(csv)
	@csv = csv
	@next_id = 1
	@employees = []
	load_csv if File.exists?(@csv)
  end

  def save_csv
	CSV.open(@csv, 'w') do |csv|
	  csv << %w[id username password role]
	  @employees.each do |employee|
		csv << [employee.id, employee.username, employee.password, employee.role]
	  end
	end
  end

  def load_csv
	CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
		row[:id] = row[:id].to_i
		@employees << Employee.new(row)
	  end
	  @next_id = @employees.empty? ? 1 : (@employees.last.id + 1)
  end

  def all_delivery_guys
    @employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
	@employees.find { |employee| employee.username == username }
  end

end