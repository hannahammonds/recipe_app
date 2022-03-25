class AddImagePathToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :image_path, :string, :default => "https://image.freepik.com/free-photo/cutting-board-with-food_1112-372.jpg"
  end
end
