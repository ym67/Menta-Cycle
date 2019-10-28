class Sss < ApplicationRecord
  before_save :set_sss_score
  before_save :set_emotions_score
  before_save :set_action_score
  before_save :set_condition_score

  # --- バリデーション ---
  validates :q1,  presence: true
  validates :q2,  presence: true
  validates :q3,  presence: true
  validates :q4,  presence: true
  validates :q5,  presence: true
  validates :q6,  presence: true
  validates :q7,  presence: true
  validates :q8,  presence: true
  validates :q9,  presence: true
  validates :q10, presence: true
  validates :q11, presence: true
  validates :q12, presence: true
  validates :q13, presence: true
  validates :q14, presence: true
  validates :q15, presence: true
  validates :q16, presence: true
  validates :q17, presence: true
  validates :q18, presence: true
  validates :q19, presence: true
  validates :q20, presence: true
  validates :q21, presence: true
  validates :q22, presence: true
  validates :q23, presence: true
  validates :q24, presence: true
  validates :q25, presence: true
  validates :q26, presence: true
  validates :q27, presence: true
  validates :q28, presence: true
  validates :q29, presence: true
  validates :q30, presence: true
  validates :q31, presence: true
  validates :q32, presence: true
  validates :q33, presence: true
  validates :q34, presence: true
  validates :q35, presence: true
  validates :q36, presence: true
  validates :q37, presence: true
  validates :q38, presence: true
  validates :q39, presence: true
  validates :q40, presence: true

  # --- コールバック ---
  # 合計点
  def set_sss_score
    self.score = (
      self.q1 + self.q2 + self.q3 + self.q4 + self.q5 + self.q6 + self.q7 + self.q8 + self.q9 + self.q10 +
      self.q11 + self.q12 + self.q13 + self.q14 + self.q15 + self.q16 + self.q17 + self.q18 + self.q19 + self.q20 +
      self.q21 + self.q22 + self.q23 + self.q24 + self.q25 + self.q26 + self.q27 + self.q28 + self.q29 + self.q30 +
      self.q31 + self.q32 + self.q33 + self.q34 + self.q35 + self.q36 + self.q37 + self.q38 + self.q39 + self.q40
      )
  end
  # 項目別 -> 感情
  def set_emotions_score
    self.emotions = (
      self.q19 + self.q21 + self.q26 + self.q27 + self.q28 + self.q29 + self.q30 + self.q31 + self.q32 + self.q33 +
      self.q36 + self.q37 + self.q38 + self.q39
    )
  end
  # 項目別 -> 行動
  def set_action_score
    self.action = (
      self.q15 + self.q20 + self.q22 + self.q23 + self.q24 + self.q25 + self.q40
    )
  end
  # 項目別 -> 体調
  def set_condition_score
    self.condition = (
      self.q1 + self.q2 + self.q3 + self.q4 + self.q5 + self.q6 + self.q7 + self.q8 + self.q9 + self.q10 +
      self.q11 + self.q12 + self.q13 + self.q14 + self.q16 + self.q17 + self.q18 + self.q34 + self.q35
    )
  end

  # --- アソシエーション ---
  belongs_to :user

  # --- カレンダー用 ---
  def start_time
    self.created_at
  end
end
