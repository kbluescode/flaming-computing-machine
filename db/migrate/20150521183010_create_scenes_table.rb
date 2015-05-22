class CreateScenesTable < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :content
      t.string :choice1_text
      t.integer :choice1_tally
      t.string :choice2_text
      t.integer :choice2_tally
      t.timestamps null: false
    end
  end
end
