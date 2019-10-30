class AddColumnsToBig5Scores < ActiveRecord::Migration[5.2]
  def change
    add_column :big5_scores, :q6, :integer, default: 4, null: false
    add_column :big5_scores, :q7, :integer, default: 4, null: false
    add_column :big5_scores, :q8, :integer, default: 4, null: false
    add_column :big5_scores, :q9, :integer, default: 4, null: false
    add_column :big5_scores, :q10, :integer, default: 4, null: false
  end
end
