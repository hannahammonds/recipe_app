class RecipeKind < ApplicationRecord 
    belongs_to :recipe
    belongs_to :kind 
end