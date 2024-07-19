require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # 1. Ask user for name
    name = @view.ask_user_for("name")
    # 2. Ask user for description
    description = @view.ask_user_for("description")
    # 3. Create a new Recipe instance
    recipe = Recipe.new(name, description)
    # 4. Send the recipe to the Cookbook
    @cookbook.create(recipe)
  end

  def list
    display_recipes
  end
  
  def remove
    # 1. Display all the recipes
    display_recipes
    # 2. Ask user for index
    index = @view.ask_user_for_index
    # 3. Remove it -> Cookbook
    @cookbook.destroy(index)
    # 4. Display it again
    display_recipes
  end
  
  private

  def display_recipes
    # 1. Get all the recipes from the Cookbook
    recipes = @cookbook.all
    # 2. Display the recipes in the View
    @view.display_list(recipes)
  end
  
end