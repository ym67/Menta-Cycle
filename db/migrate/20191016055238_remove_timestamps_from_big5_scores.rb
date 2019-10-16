class RemoveTimestampsFromBig5Scores < ActiveRecord::Migration[5.2]
  def change
    remove_column :big5_scores, :created_at, :datetime
    remove_column :big5_scores, :updated_at, :datetime
  end
end
