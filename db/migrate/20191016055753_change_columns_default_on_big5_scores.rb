class ChangeColumnsDefaultOnBig5Scores < ActiveRecord::Migration[5.2]
  def change
    change_column_default :big5_scores, :q1, from: 0, to: 1
    change_column_default :big5_scores, :q2, from: 0, to: 1
    change_column_default :big5_scores, :q3, from: 0, to: 1
    change_column_default :big5_scores, :q4, from: 0, to: 1
    change_column_default :big5_scores, :q5, from: 0, to: 1
    change_column_default :big5_scores, :q6, from: 0, to: 1
    change_column_default :big5_scores, :q7, from: 0, to: 1
    change_column_default :big5_scores, :q8, from: 0, to: 1
    change_column_default :big5_scores, :q9, from: 0, to: 1
    change_column_default :big5_scores, :q10, from: 0, to: 1
  end
end
