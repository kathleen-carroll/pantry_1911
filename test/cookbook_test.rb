require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class PantryTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new

    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    @ingredient4 = Ingredient.new("Bun", "g", 1)
    @recipe2 = Recipe.new("Burger")
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
  end

  def test_it_exists
    assert_instance_of Cookbook, @cookbook
  end

  def test_it_has_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_to_cookbook
    @cookbook.add_recipe(@recipe1)
    assert_equal [@recipe1], @cookbook.recipes
    @cookbook.add_recipe(@recipe2)
    #expect hash with name and details of recipe
    #details of recipe is hash of ingredients and total calories
    #ingredients in hash is array of ingredient hashes
    expected1 = {:name=>"Mac and Cheese",
                 :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
                                           {:ingredient=>"Cheese", :amount=>"2 C"}],
                            :total_calories=>440}
    }
  end

  def test_it_can_return_summary
    #assert_nil @cookbook.summary

    @cookbook.add_recipe(@recipe1)
    expected1 = {:name=>"Mac and Cheese",
                 :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
                                           {:ingredient=>"Cheese", :amount=>"2 C"}],
                            :total_calories=>440}
    }
    @cookbook.summary
  end
end

# {:name=>"Mac and Cheese",
#  :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
#                            {:ingredient=>"Cheese", :amount=>"2 C"}],
#             :total_calories=>440}
# },
# {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
