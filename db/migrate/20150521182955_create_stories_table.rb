class CreateStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :tags

      t.references :user
      t.timestamps null: false
    end
  end
end
