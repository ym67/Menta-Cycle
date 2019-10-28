class RemoveThinkingFromSsses < ActiveRecord::Migration[5.2]
  def change
    remove_column :ssses, :thinking, :integer
  end
end
