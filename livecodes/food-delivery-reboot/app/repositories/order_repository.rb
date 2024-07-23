require 'csv'
require_relative "../models/order"

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    @orders = []
    load_csv if File.exist?(csv_file_path)
  end

  def create(order)
    # 1. Set the id of the order
    order.id = @next_id
    # 2. Increment the id
    @next_id += 1
    # 3. Push the order to the orders array
    @orders << order
    # 4. Save to CSV
    save_csv
  end
  
  def all
    @orders
  end
  
  def find(id)
    @orders.find { |order| order.id == id }
  end


  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i) # => Instance of Meal
      row[:customer] = @customer_repository.find(row[:customer_id].to_i) # => Instance of Meal
      row[:employee] = @employee_repository.find(row[:employee_id].to_i) # => Instance of Meal
      row[:delivered] = row[:delivered] == "true"
      order = Order.new(row)
      p order
      @orders << order
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "meal_id", "customer_id", "employee_id", "delivered"]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered]
      end
    end
  end
end