class Recipe < ApplicationRecord
    validates :name, presence:true, length: {minimum: 3, maximum: 60} 
    validates :ingredients, presence:true, length: {minimum: 6, maximum: 100}
    validates :instructions, presence:true, length: {minimum: 6}
    validate :image_path_exists,

    def image_path_exists
        require 'open-uri'
        begin
            url = URI.open(image_path)
            errors.add(:image_path, "does not contain image") and return unless url.content_type.starts_with("image")
        rescue
            errors.add(:image_path, "Invalid URL")
        end
    end
end