class Recipe < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :recipe_cards
    has_many :ingredients, through: :recipe_ingredients
    has_many :users, through: :recipe_cards
    def self.most_popular
        self.all.reduce(Recipe.first) do |memo, recipe|
            if recipe.recipe_cards.size > memo.recipe_cards.size
                memo = recipe
            end
            memo
        end
    end
    def allergens
        # pizza.ingredients [cheese, noodles]
        my_ingredients = self.ingredients

        # Allergy.all.ingredient [cheese, bechamel]
        all_allergens = Allergy.all.map do |allergy|
            allergy.ingredient
        end
        
        # select from pizza array whatever's found in allergy array
        my_ingredients.select do |ingredient|
            all_allergens.include?(ingredient)
        end
    end
    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.create(recipe_id: self.id, ingredient_id: ingredient.id)
        end
    end

end