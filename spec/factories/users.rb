FactoryBot.define do
  factory :test_user1, class: User do
    id { 1 }
    admin { true }
    name { 'テストユーザ1(admin)' }
    gender { true }
    age { '20' }
    email { 'test1@example.com' }
    password { 'test111'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_user2, class: User do
    id { 2 }
    admin { false }
    name { 'テストユーザ2' }
    gender {false }
    age { '30' }
    email { 'test2@example.com' }
    password { 'test222'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_user3, class: User do
    id { 3 }
    admin { false }
    name { 'テストユーザ3' }
    gender { true }
    age { '40' }
    email { 'test3@example.com' }
    password { 'test333'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_user4, class: User do
    id { 4 }
    admin { false }
    name { 'テストユーザ4' }
    gender { false }
    age { '50' }
    email { 'test4@example.com' }
    password { 'test444'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

end
