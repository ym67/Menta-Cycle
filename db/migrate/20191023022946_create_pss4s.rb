class CreatePss4s < ActiveRecord::Migration[5.2]
  def change
    create_table :pss4s do |t|
      t.integer :q1, default: 0, null: false
      t.integer :q2, default: 0, null: false
      t.integer :q3, default: 0, null: false
      t.integer :q4, default: 0, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
