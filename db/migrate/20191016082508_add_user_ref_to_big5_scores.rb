class AddUserRefToBig5Scores < ActiveRecord::Migration[5.2]
  def change
    add_reference :big5_scores, :user, foreign_key: true
  end
end
