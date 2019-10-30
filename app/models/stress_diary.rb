class StressDiary < ApplicationRecord
  # --- バリデーション ---
  validates :time, presence: true
  validates :stress_level, numericality: { less_than_or_equal_to: 10 }
  validates :duration, length: { maximum: 120 }
  validates :situation, length: { in: 1..500 }
  validates :trigger, length: { in: 1..500 }
  validates :reaction, length: { in: 1..500 }

  # --- アソシエーション ---
  belongs_to :user

  # --- カレンダー用 ---
  def start_time
    self.created_at
  end
end
