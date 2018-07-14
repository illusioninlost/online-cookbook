class AddCatererIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :caterer_id, :integer
  end
end
