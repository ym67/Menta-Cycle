# $ bin/rspec spec/models/sss_spec.rb

require 'rails_helper'

RSpec.describe Sss, type: :model do
  it "仮に数字以外のパラメータが飛んでも、保存されない" do
    FactoryBot.create(:test_user1)
    sss = Sss.new(q1: "ほげほげ", user_id: 1)
    sss.save
    expect(sss).to be_valid
  end

  it "scoreカラムには、自動で全てのqカラムの数字を合計した値が入る" do
    FactoryBot.create(:test_user1)
    sss = Sss.new(q1: 1, q2: 1, q3: 1, user_id: 1)
    sss.save
    expect(sss.score).to eq 3
  end

  it "actionカラムには、自動で該当するqカラムの数字を合計した値が入る" do
    FactoryBot.create(:test_user1)
    sss = Sss.new(q1: 1, q15: 1, q20: 1, q22: 1, user_id: 1)
    sss.save
    expect(sss.action).to eq 3
  end

  it "conditionカラムには、自動で該当するqカラムの数字を合計した値が入る" do
    FactoryBot.create(:test_user1)
    sss = Sss.new(q1: 1, q2: 1, q3: 1, q19: 1, user_id: 1)
    sss.save
    expect(sss.condition).to eq 3
  end

  it "emotionsカラムには、自動で該当するqカラムの数字を合計した値が入る" do
    FactoryBot.create(:test_user1)
    sss = Sss.new(q1: 1, q19: 1, q21: 1, q26: 1, user_id: 1)
    sss.save
    expect(sss.emotions).to eq 3
  end
end
