class RenameColumnsOnBig5Scores < ActiveRecord::Migration[5.2]
  def change
    rename_column :big5_scores, :neuroticism, :q1
    rename_column :big5_scores, :extraversion, :q2
    rename_column :big5_scores, :openness_to_experience, :q3
    rename_column :big5_scores, :agreeableness, :q4
    rename_column :big5_scores, :conscientiousness, :q5
  end
end
