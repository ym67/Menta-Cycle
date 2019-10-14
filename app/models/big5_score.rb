class Big5Score < ApplicationRecord
  validates :neuroticism, length: { is: 1 }
  validates :extraversion, length: { is: 1 }
  validates :openness_to_experience, length: { is: 1 }
  validates :agreeableness, length: { is: 1 }
  validates :conscientiousness, length: { is: 1 }
end
