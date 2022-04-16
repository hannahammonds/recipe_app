class CreateRatingTable < ActiveRecord::Migration[6.1]
  def change
    create_table :rating_tables do |t|
      t.integer :recipe_id 
      t.float :rating
      t.timestamps
    end
  end
end
