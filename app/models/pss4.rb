class Pss4 < ApplicationRecord
  before_save :set_pss4_score

  # --- バリデーション ---
  validates :q1,  presence: true
  validates :q2,  presence: true
  validates :q3,  presence: true
  validates :q4,  presence: true

  # --- コールバック ---
  def set_pss4_score
    self.score = (self.q1 + self.q2 + self.q3 + self.q4)
  end

  # --- アソシエーション ---
  belongs_to :user

  # --- カレンダー用 ---
  def start_time
    self.created_at
  end
end
