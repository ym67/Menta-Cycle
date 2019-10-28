class CreateSsses < ActiveRecord::Migration[5.2]
  def change
    create_table :ssses do |t|
      t.integer :q1, default: 0, null: false
      t.integer :q2, default: 0, null: false
      t.integer :q3, default: 0, null: false
      t.integer :q4, default: 0, null: false
      t.integer :q5, default: 0, null: false
      t.integer :q6, default: 0, null: false
      t.integer :q7, default: 0, null: false
      t.integer :q8, default: 0, null: false
      t.integer :q9, default: 0, null: false
      t.integer :q10, default: 0, null: false
      t.integer :q11, default: 0, null: false
      t.integer :q12, default: 0, null: false
      t.integer :q13, default: 0, null: false
      t.integer :q14, default: 0, null: false
      t.integer :q15, default: 0, null: false
      t.integer :q16, default: 0, null: false
      t.integer :q17, default: 0, null: false
      t.integer :q18, default: 0, null: false
      t.integer :q19, default: 0, null: false
      t.integer :q20, default: 0, null: false
      t.integer :q21, default: 0, null: false
      t.integer :q22, default: 0, null: false
      t.integer :q23, default: 0, null: false
      t.integer :q24, default: 0, null: false
      t.integer :q25, default: 0, null: false
      t.integer :q26, default: 0, null: false
      t.integer :q27, default: 0, null: false
      t.integer :q28, default: 0, null: false
      t.integer :q29, default: 0, null: false
      t.integer :q30, default: 0, null: false
      t.integer :q31, default: 0, null: false
      t.integer :q32, default: 0, null: false
      t.integer :q33, default: 0, null: false
      t.integer :q34, default: 0, null: false
      t.integer :q35, default: 0, null: false
      t.integer :q36, default: 0, null: false
      t.integer :q37, default: 0, null: false
      t.integer :q38, default: 0, null: false
      t.integer :q39, default: 0, null: false
      t.integer :q40, default: 0, null: false
      t.integer :score, default: 0, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
