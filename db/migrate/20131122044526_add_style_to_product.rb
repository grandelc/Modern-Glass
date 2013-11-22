class AddStyleToProduct < ActiveRecord::Migration
  def change
    add_column :products, :style, :string
  end
end
