# $ bin/rspec spec/models/stress_diary_spec.rb

require 'rails_helper'

RSpec.describe StressDiary, type: :model do
  it "「時間(time)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    diary = StressDiary.new(time: nil, situation: '失敗テスト', trigger: '失敗テスト', reaction: '失敗テスト', user_id: 1)
    expect(diary).not_to be_valid
  end

  it "「状況(situation)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    diary = StressDiary.new(time: Time.current, situation: '', trigger: '失敗テスト', reaction: '失敗テスト', user_id: 1)
    expect(diary).not_to be_valid
  end

  it "「きっかけ(trigger)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    diary = StressDiary.new(time: Time.current, situation: '失敗テスト', trigger: '', reaction: '失敗テスト', user_id: 1)
    expect(diary).not_to be_valid
  end

  it "「リアクション(reaction)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    diary = StressDiary.new(time: Time.current, situation: '失敗テスト', trigger: '失敗テスト', reaction: '', user_id: 1)
    expect(diary).not_to be_valid
  end

  it "「時間(time)・状況(situation)・きっかけ(trigger)・リアクション(reaction)」の全てが記載されていればバリデーションが通る" do
    FactoryBot.create(:test_user1)
    diary = StressDiary.new(time: Time.current, situation: '成功テスト', trigger: '成功テスト', reaction: '成功テスト', user_id: 1)
    expect(diary).to be_valid
  end
end
