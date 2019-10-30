FactoryBot.define do
  factory :stress_diary1, class: StressDiary do
    user_id { 1 }
    time { Time.current }
    stress_level { 1 }
    duration { "10〜20分" }
    situation { "テスト1" }
    trigger { "テスト1" }
    reaction { "テスト1" }
  end

  factory :stress_diary2, class: StressDiary do
    user_id { 1 }
    time { Time.current }
    stress_level { 2 }
    duration { "20〜30分" }
    situation { "テスト2" }
    trigger { "テスト2" }
    reaction { "テスト2" }
  end
end
