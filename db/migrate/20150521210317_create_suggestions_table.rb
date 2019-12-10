class CreateSuggestionsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :suggestions do |t|
      t.string :noun
      
      t.timestamps null: false
    end
  end
end
