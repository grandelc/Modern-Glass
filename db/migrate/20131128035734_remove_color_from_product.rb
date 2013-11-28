class RemoveColorFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :color
  end

  def down
    add_column :products, :color, :string
  end
end
