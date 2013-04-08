class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :caption, null: false
      t.string :attribution

      t.string :scaled_image_key, null: false
      t.string :original_image_key, null: false

      t.references :stream
      t.references :user

      t.timestamps
    end
  end
end
