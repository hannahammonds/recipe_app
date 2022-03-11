class Recipe < ApplicationRecord
    validates :name, presence:true, length: {minimum: 3, maximum: 60} 
    validates :ingredients, presence:true, length: {minimum: 2, maximum: 100}
    validates :instructions, presence:true, length: {minimum: 6}
    
end