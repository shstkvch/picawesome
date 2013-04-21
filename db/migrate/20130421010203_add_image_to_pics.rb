class AddImageToPics < ActiveRecord::Migration
  def up
    add_attachment :pics, :image
    remove_column  :pics, :scaled_image_key
    remove_column  :pics, :original_image_key
  end

  def down
    remove_attachment :pics, :image
    add_column  :pics, :scaled_image_key, :string
    add_column  :pics, :original_image_key, :string
  end
end
