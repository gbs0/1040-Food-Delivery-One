require_relative '../models/meal'
require 'csv'

class MealRepository
  def initialize(csv)
    @csv = csv
    @meals = []
    @next_id = 1
    load_csv if File.exists?(@csv)
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv, "w") do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : (@meals.last.id + 1)
  end
end