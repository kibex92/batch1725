require_relative "app/repositories/meal_repository"

p meal_repository = MealRepository.new(File.join(__dir__, "data/meals.csv"))
