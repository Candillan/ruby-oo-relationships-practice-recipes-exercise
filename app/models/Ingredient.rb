class Ingredient < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :allergies
    has_many :recipes, through: :recipe_ingredients
    has_many :users, through: :allergies

    def self.most_common_allergen
        self.all.reduce(Ingredient.first) do |memo, ingredient|
            if ingredient.allergies.size > memo.allergies.size
                memo = ingredient
            end
            memo
        end
    end
end
