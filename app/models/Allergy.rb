class Allergy < ActiveRecord::Base
    belongs_to :ingredient
    belongs_to :user
end