class CreateScenesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :scenes do |t|
      t.string :content
      t.string :choice1_text
      t.integer :choice1_tally
      t.references :scene1
      t.string :choice2_text
      t.integer :choice2_tally
      t.references :scene2

      t.references :user
      t.references :story
      t.timestamps null: false
    end
  end
end
