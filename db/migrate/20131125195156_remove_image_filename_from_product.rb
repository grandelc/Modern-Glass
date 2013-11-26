class RemoveImageFilenameFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :image_filename
  end

  def down
    add_column :products, :image_filename, :string
  end
end
