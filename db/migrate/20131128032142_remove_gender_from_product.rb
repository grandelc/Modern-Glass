class RemoveGenderFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :gender
  end

  def down
    add_column :products, :gender, :string
  end
end
