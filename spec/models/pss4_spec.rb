# $ bin/rspec spec/models/pss4_spec.rb

require 'rails_helper'

RSpec.describe Pss4, type: :model do
  it "仮に数字以外のパラメータが飛んでも、保存されない(デフォルト値で保存)" do
    FactoryBot.create(:test_user1)
    pss4 = Pss4.new(q1: "ほげほげ", user_id: 1)
    pss4.save
    expect(pss4).to be_valid
    expect(pss4.q1).to eq 0

  end

  it "scoreカラムには、自動で全てのqカラムの数字を合計した値が入る" do
    FactoryBot.create(:test_user1)
    pss4 = Pss4.new(q1: 1, q2: 1, q3: 1, user_id: 1)
    pss4.save
    expect(pss4.score).to eq 3
  end
end
