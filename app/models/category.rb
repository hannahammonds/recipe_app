class Category < ApplicationRecord 
    has_many :recipe_categories 
    has_many :recipes, through: :recipe_categories 
    validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25 }
    # validate :image_path_exists
    
    # def image_path_exists
    #     require 'open-uri'
    #     begin
    #         url = URI.open(image_path)
    #         errors.add(:image_path, "does not contain image") and return unless url.content_type.starts_with?("image")
    #     rescue
    #         errors.add(:image_path, "Invalid URL")
    #     end
    # end

    
end