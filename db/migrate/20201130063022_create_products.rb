class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.references :brand, null: false, foreign_key: true
      t.string :description
      t.integer :average_product_rating_stars
      t.integer :average_safety_rating_bar
      t.integer :average_efficacy_rating_bar

      t.timestamps
    end
  end
end
