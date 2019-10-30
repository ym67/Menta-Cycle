FactoryBot.define do
  factory :stress_diary do
    time { "2019-10-21 10:13:46" }
    stress_level { 1 }
    duration { 1 }
    situation { "MyString" }
    trigger { "MyString" }
    reaction { "MyString" }
  end
end
