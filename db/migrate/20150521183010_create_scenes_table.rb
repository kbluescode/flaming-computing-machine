class CreateScenesTable < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :content
      t.string :choice1_text
      t.references :scene1
      t.integer :choice1_tally
      t.string :choice2_text
      t.references :scene2
      t.integer :choice2_tally
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
