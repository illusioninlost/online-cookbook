class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.integer :ratings
      t.integer :recipe_id

      t.timestamps
    end
  end
end
