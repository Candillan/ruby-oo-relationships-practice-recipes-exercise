class CreateRecipeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_cards do |t|
      t.integer  :user_id
      t.integer  :recipe_id
      t.integer  :rating
      t.datetime :date
    end
  end
end
