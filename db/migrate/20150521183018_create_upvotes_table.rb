class CreateUpvotesTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user
      t.references :story
    end
  end
end
