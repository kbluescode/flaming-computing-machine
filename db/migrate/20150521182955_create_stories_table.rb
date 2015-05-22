class CreateStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :tags
      t.timestamps null: false
    end
  end
end
