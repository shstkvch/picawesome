class CreateShortlinks < ActiveRecord::Migration
  def change
    create_table :shortlinks do |t|
      t.string  :slug
      t.string  :reference
      t.integer :counter,   null: false, default: 0

      t.timestamps
    end

    add_index 'shortlinks', 'slug', unique: true
    add_index 'shortlinks', 'reference'
  end
end
