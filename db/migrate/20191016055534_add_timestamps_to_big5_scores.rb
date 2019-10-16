class AddTimestampsToBig5Scores < ActiveRecord::Migration[5.2]
  def change
    add_column :big5_scores, :created_at, :datetime, null: false
    add_column :big5_scores, :updated_at, :datetime, null: false
  end
end
