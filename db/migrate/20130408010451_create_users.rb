class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false

      # Auth stuff will be added in another migration

      t.timestamps
    end

    add_index 'users', 'username', unique: true
  end
end
