class UnFuckUpShortLinks < ActiveRecord::Migration
  def change
    change_column :shortlinks, :slug,      :string, null: false
    change_column :shortlinks, :reference, :string, null: false

    remove_index  :shortlinks, column: :reference
  end
end
