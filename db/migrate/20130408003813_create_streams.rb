class CreateStreams < ActiveRecord::Migration
  def change
     create_table :streams do |t|
      t.string :slug, null: false

      t.string :upvote_copy
      t.string :downvote_copy

      t.string :background_color

      t.boolean :nsfw, null: false, default: false

      t.timestamps
    end

    add_index 'streams', 'slug', unique: true
  end
end
