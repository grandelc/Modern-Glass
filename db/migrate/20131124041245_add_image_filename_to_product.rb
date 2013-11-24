class AddImageFilenameToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image_filename, :string
  end
end
