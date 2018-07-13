class CreateCaterers < ActiveRecord::Migration[5.2]
  def change
    create_table :caterers do |t|

      t.timestamps
    end
  end
end
