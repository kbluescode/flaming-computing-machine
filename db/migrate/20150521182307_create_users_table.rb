class CreateUsersTable < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.timestamps null: false
    end
  end
end
