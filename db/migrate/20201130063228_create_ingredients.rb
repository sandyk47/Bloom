class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :average_safety_rating
      t.integer :average_efficacy_rating
      t.string :description
      t.timestamps
    end
  end
end
