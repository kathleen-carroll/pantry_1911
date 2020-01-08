class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] != nil
      @stock[ingredient]
    else 0
    end
  end

  def restock(ingredient, amount)
    if @stock.keys.include?(ingredient)
      @stock[ingredient] += amount
    else @stock[ingredient] = amount
    end
  end

  def enough_ingredients_for?(recipe)
    amounts_needed = recipe.ingredients_required.reduce({}) do |amounts, ingredient|
      amounts[ingredient.first.name] = ingredient.last
      amounts
    end

    amounts_stocked = recipe.ingredients.reduce({}) do |amounts, ingredient|
      amounts[ingredient.name] = stock_check(ingredient)
      amounts
    end

    compared = amounts_needed.keys.map do |key|
      amounts_needed[key] <= amounts_stocked[key]
    end

    compared.uniq == [true]
  end
end
