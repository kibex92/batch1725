require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def create(recipe)
    @recipes << recipe
    write_csv
  end

  def all
    @recipes
  end

  def destroy(index)
    @recipes.delete_at(index)
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
    end
  end

  def write_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end