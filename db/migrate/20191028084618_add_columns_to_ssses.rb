class AddColumnsToSsses < ActiveRecord::Migration[5.2]
  def change
    add_column :ssses, :action, :integer, default: 0.0, null: false
    add_column :ssses, :condition, :integer, default: 0.0, null: false
    add_column :ssses, :thinking, :integer, default: 0.0, null: false
    add_column :ssses, :emotions, :integer, default: 0.0, null: false
  end
end
