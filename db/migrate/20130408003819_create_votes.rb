class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :pic, null: false
      t.references :user, null: false

      t.boolean :value, null: false

      t.timestamps
    end

    add_index 'votes', ['pic_id', 'user_id'], unique: true # One vote per item per person only
    add_index 'votes', 'pic_id'
  end
end
