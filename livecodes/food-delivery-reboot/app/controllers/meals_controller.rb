require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meals_view = MealsView.new
    @meal_repository = meal_repository
  end
  
  def add
    # 1. Ask user for name
    name = @meals_view.ask_user_for("name")
    # 2. Ask user for price
    price = @meals_view.ask_user_for_price
    # 3. Create an instance of Meal
    meal = Meal.new(name: name, price: price)
    # 4. Send it to the repository
    @meal_repository.create(meal)
  end
end