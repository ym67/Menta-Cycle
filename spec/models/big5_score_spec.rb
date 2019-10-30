# $ bin/rspec spec/models/big5_score_spec.rb

require 'rails_helper'

RSpec.describe Big5Score, type: :model do
  it "仮に数字以外のパラメータが飛んでも、保存されない(デフォルト値で保存)" do
    FactoryBot.create(:test_user1)
    big5 = Big5Score.new(q1: "ほげほげ", user_id: 1)
    big5.save
    expect(big5).to be_valid
    expect(big5.q1).to eq 0
  end
end
