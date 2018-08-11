class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
