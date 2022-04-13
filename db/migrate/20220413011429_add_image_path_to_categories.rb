class AddImagePathToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :image_path, :string, :default => "https://live.staticflickr.com/65535/52000918166_3a9b5bcaf6_c.jpg"
  end
end
