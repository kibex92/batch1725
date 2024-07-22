require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"









meal_repository = MealRepository.new(File.join(__dir__, "data/meals.csv"))
meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)
router.run