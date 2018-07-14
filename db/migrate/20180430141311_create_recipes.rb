class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :creator
      t.string :notes
      t.string :special_tools
      t.integer :approximate_time
      t.string :ingredients
      t.integer :user_id
      t.string :phone_number

      t.timestamps
    end
  end
end
