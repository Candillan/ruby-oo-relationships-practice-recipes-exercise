User.delete_all
Recipe.delete_all
Ingredient.delete_all
RecipeCard.delete_all
Allergy.delete_all
RecipeIngredient.delete_all

calvin = User.create(name: "Calvin")
alona = User.create(name: "Alona")

lasagna = Recipe.create(name: "Lasagna")
pizza = Recipe.create(name: "Pizza")
mac_and_cheese = Recipe.create(name: "Mac and Cheese")
cheese_board = Recipe.create(name: "Cheese Board")

noodles = Ingredient.create(name: "Noodles")
cheese = Ingredient.create(name: "Cheese")
bechamel = Ingredient.create(name: "Béchamel")

RecipeCard.create(user_id: calvin.id, recipe_id: pizza.id, rating: 2, date: Time.now)
RecipeCard.create(user_id: alona.id, recipe_id: lasagna.id, rating: 5, date: Time.now)
RecipeCard.create(user_id: alona.id, recipe_id: pizza.id, rating: 3, date: Time.now)

Allergy.create(user_id: alona.id, ingredient_id: cheese.id)
Allergy.create(user_id: calvin.id, ingredient_id: bechamel.id)

RecipeIngredient.create(recipe_id: lasagna.id, ingredient_id: noodles.id)
RecipeIngredient.create(recipe_id: lasagna.id, ingredient_id: bechamel.id)
RecipeIngredient.create(recipe_id: pizza.id, ingredient_id: cheese.id)
RecipeIngredient.create(recipe_id: pizza.id, ingredient_id: noodles.id)
RecipeIngredient.create(recipe_id: cheese_board.id, ingredient_id: cheese.id)