class AddScoreToPss4s < ActiveRecord::Migration[5.2]
  def change
    add_column :pss4s, :score, :integer, default: 0, null: false
  end
end
