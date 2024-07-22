require 'csv'
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    @customers = []
    load_csv if File.exist?(csv_file_path)
  end

  def create(customer)
    # 1. Set the id of the customer
    customer.id = @next_id
    # 2. Increment the id
    @next_id += 1
    # 3. Push the customer to the customers array
    @customers << customer
    # 4. Save to CSV
    save_csv
  end
  
  def all
    @customers
  end
  
  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end