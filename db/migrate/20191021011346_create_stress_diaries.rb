class CreateStressDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :stress_diaries do |t|
      t.time :time, null: false
      t.integer :stress_level, null: false, default: 0
      t.integer :duration, null: false, default: ""
      t.string :situation, null: false, default: ""
      t.string :trigger, null: false, default: ""
      t.string :reaction, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
