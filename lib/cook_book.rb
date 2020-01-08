class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    num = 0
    ingredients = @recipes.reduce({}) do |hash, recipe|
      recipe.ingredients_required.each do |ingredient|
        hash[ingredient.first] = ingredient.last
        hash
      end
      hash
    end

    deets = ingredients.reduce([]) do |array, ingredient|
      array << {:ingredient => ingredient.first.name, :amount => ingredient.last}
      array
    end
  end
end
