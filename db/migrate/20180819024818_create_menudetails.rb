class CreateMenudetails < ActiveRecord::Migration[5.2]
  def change
    create_table :menudetails do |t|
      t.references :menu, foreign_key: true
      t.references :category, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
    add_index :menudetails, [:menu_id, :category_id, :dish_id], unique: true
  end
end
