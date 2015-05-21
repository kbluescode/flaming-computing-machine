class CreateSuggestionsTable < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :noun
      
      t.timestamps null: false
    end
  end
end
