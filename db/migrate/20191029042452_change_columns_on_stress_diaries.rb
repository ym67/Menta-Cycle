class ChangeColumnsOnStressDiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :stress_diaries, :duration, :string, default: "", null: false
  end
end
