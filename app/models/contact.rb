class Contact < ApplicationRecord
  # --- バリデーション ---
  validates :name, length: { in: 1..50 }
  validates :email, length: { in: 1..255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :content, length: { in: 1..2000 }

  # --- アソシエーション ---
  belongs_to :user
end
