class CreateCaterers < ActiveRecord::Migration[5.2]
  def change
    create_table :caterers do |t|

      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.timestamps
    end
  end
end
