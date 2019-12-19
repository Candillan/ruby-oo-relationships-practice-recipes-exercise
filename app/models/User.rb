class User < ActiveRecord::Base
    has_many :recipe_cards
    has_many :allergies
    has_many :recipes, through: :recipe_cards
    has_many :ingredients, through: :allergies

    def allergens
        self.ingredients
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.create(recipe_id: recipe.id, user_id: self.id, rating: rating, date: date)
    end

    def declare_allergy(ingredient)
        Allergy.create(ingredient_id: ingredient.id, user_id: self.id)
    end

    def top_three_recipes
        # self.recipes
        top_recipe_cards = self.recipe_cards.sort_by{|recipe_card| recipe_card.rating}.reverse
        # sorted by rating
        # take first three elements of that array
        top_three = top_recipe_cards.take(3)
        top_three.map do |recipe_card|
            recipe_card.recipe
        end
    end

    def most_recent_recipe
        top_recipe_cards = self.recipe_cards.sort_by{|recipe_card| recipe_card.date}.reverse
        top_recipe_cards[0]
    end

    def safe_recipes
        # pizza.ingredients [cheese, noodles]
        my_allergies = self.ingredients
        # get all the recipes
        
        # iterate over each recipe
        Recipe.all.select do |recipe|
            !allergy_checker(recipe.ingredients, my_allergies)
        end
        # select the recipes for which the following is true:
        # every recipe ingredient is not in my_allergies array
         
    end
    def allergy_checker(recipe_ingredients, allergies)
        recipe_ingredients.reduce(false) do |memo, ingredient|
            memo = memo || allergies.include?(ingredient)
            binding.pry
        end
    end
end
