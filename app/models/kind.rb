class Kind < ApplicationRecord 
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 } 

    has_many :recipe_kinds 
    has_many :recipes, through: :recipe_kinds 
end