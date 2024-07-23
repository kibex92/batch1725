require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
  end

  def add
    meal = get_meal
    customer = get_customer
    employee = get_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  private

  def get_meal
    # 1. Get all meals from the meal repo
    meals = @meal_repository.all
    # 2. Pass the meals to the MealsView
    MealsView.new.display(meals)
    # 3. Ask user for the number
    index = @orders_view.ask_user_for_index
    # 4. Take the meal out of the meals array with the user index
    return meals[index]
  end

  def get_customer
    # 1. Get all meals from the meal repo
    customers = @customer_repository.all
    # 2. Pass the customers to the customersView
    CustomersView.new.display(customers)
    # 3. Ask user for the number
    index = @orders_view.ask_user_for_index
    # 4. Take the customer out of the customers array with the user index
    customers[index]
  end

  def get_employee
    # 1. Get all meals from the meal repo
    riders = @employee_repository.all_riders
    # 2. Pass the employees to the employeesView
    OrdersView.new.display(riders)
    # 3. Ask user for the number
    index = @orders_view.ask_user_for_index
    # 4. Take the employee out of the employees array with the user index
    riders[index]
  end
end