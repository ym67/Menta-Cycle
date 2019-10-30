class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, default: "", null: false
      t.string :email, default: "", null: false
      t.text :content, default: "", null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
