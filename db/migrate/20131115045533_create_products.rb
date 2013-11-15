class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model
      t.string :description
      t.decimal :price
      t.integer :stock_quantity
      t.integer :ranking

      t.timestamps
    end
  end
end
