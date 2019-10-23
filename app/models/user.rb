class User < ApplicationRecord
  # --- devise関係 ---
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, :confirmable, :trackable

  # --- バリデーション ---
  validates :name,     length: { in: 1..50  }
  validates :email,    length: { in: 1..255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, allow_nil: true

  # --- アソシエーション ---
  has_many :big5_scores
  has_many :stress_diaries
end
