require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    @meals = []
    load_csv if File.exist?(csv_file_path)
  end

  def create(meal)
    # 1. Set the id of the meal
    meal.id = @next_id
    # 2. Increment the id
    @next_id += 1
    # 3. Push the meal to the meals array
    @meals << meal
    # 4. Save to CSV
    save_csv
  end
  
  def all
    @meals
  end
  
  def find(id)
    @meals.find { |meal| meal.id == id }
  end


  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end