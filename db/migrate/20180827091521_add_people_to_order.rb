class AddPeopleToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :people, :integer
  end
end
