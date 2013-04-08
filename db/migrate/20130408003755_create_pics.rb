class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :caption, null: false
      t.string :attribution

      t.string :scaled_image_key, null: false
      t.string :original_image_key, null: false

      t.references :stream, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
