class CreateBig5Scores < ActiveRecord::Migration[5.2]
  def change
    create_table :big5_scores do |t|
      t.integer :neuroticism, default: 4, null: false
      t.integer :extraversion, default: 4, null: false
      t.integer :openness_to_experience, default: 4, null: false
      t.integer :agreeableness, default: 4, null: false
      t.integer :conscientiousness, default: 4, null: false

      t.timestamps
    end
  end
end
