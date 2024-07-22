require_relative "../models/customer"
require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # 1. Ask user for name
    name = @customers_view.ask_user_for("name")
    # 2. Ask user for price
    address = @customers_view.ask_user_for("address")
    # 3. Create an instance of Meal
    customer = Customer.new(name: name, address: address)
    # 4. Send it to the repository
    @customer_repository.create(customer)
  end

  def list
    customers = @customer_repository.all
    @customers_view.display(customers)
  end
end