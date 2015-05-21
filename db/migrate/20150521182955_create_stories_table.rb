class CreateStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :description
      t.string :tags
      t.integer :total_upvotes
      t.references :scene
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
