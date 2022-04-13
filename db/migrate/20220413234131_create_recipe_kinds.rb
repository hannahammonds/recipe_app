class CreateRecipeKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_kinds do |t|
      t.integer :recipe_id 
      t.integer :kind_id 
      t.timestamps
    end
  end
end
