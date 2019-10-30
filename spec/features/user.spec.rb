 # $ bin/rspec spec/features/user.spec.rb

require 'rails_helper'

RSpec.feature "ユーザに関する機能", type: :feature do
  scenario "ユーザ新規登録のテスト" do
    visit new_user_registration_path
    fill_in 'user_name', with: 'テストユーザ1'
    choose '男性'
    select '20代', from: 'user_age'
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    fill_in 'user_password_confirmation', with: 'test111'
    click_on '登録' # => マイページへリダイレクト
    expect(page).to have_content 'マイページ'
    expect(page).to have_content 'テストユーザ1さんのデータ'
  end

  scenario "ログインのテスト" do
    FactoryBot.create(:test_user1)
    visit new_user_session_path
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
    expect(page).to have_content 'マイページ'
    expect(page).to have_content 'テストユーザ1(admin)さんのデータ'
  end

  scenario "ログアウトのテスト" do
    FactoryBot.create(:test_user1)
    visit new_user_session_path
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
    click_on 'ログアウト' # => ログインページへリダイレクト
    expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    expect(page).to have_content 'ログイン'
  end

  scenario "未ログインの場合、ログイン画面・新規登録画面・お問い合わせ画面のみアクセス不可になっているかのテスト" do
    FactoryBot.create(:test_user1)
    visit new_user_registration_path
    expect(page).to have_content "アカウント作成"
    visit new_user_session_path
    expect(page).to have_content "ログイン"
    visit new_contact_path
    expect(page).to have_content "お問い合わせ"
    visit dailry_data_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit user_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit new_pss4_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit pss4_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit new_sss_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit sss_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit new_big5_score_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit big5_score_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit stress_diaries_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit new_stress_diary_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit edit_stress_diary_path(1)
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
    visit rails_admin_path
    expect(page).to have_content "アカウント登録もしくはログインしてください。"
  end

  scenario "ログイン済みの場合、ログイン画面か新規登録画面にはアクセス不可になっているかのテスト" do
    FactoryBot.create(:test_user1)
    visit new_user_session_path
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
    visit new_user_registration_path
    expect(page).to have_content "すでにログインしています。"
    visit new_user_session_path
    expect(page).to have_content "すでにログインしています。"
  end

  scenario "管理者権限を持ったユーザにのみ管理メニューが表示されるかのテスト(権限有りver)" do
    FactoryBot.create(:test_user1)
    visit new_user_session_path
    # 管理者でログイン
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
    expect(page).to have_content "管理メニュー"
  end

  scenario "管理者権限を持ったユーザにのみ管理メニューが表示されるかのテスト(権限無しver)" do
    FactoryBot.create(:test_user2)
    visit new_user_session_path
    # 管理者でログイン
    fill_in 'user_email', with: 'test2@example.com'
    fill_in 'user_password', with: 'test222'
    click_on 'ログイン' # => マイページへリダイレクト
    expect(page).not_to have_content "管理メニュー"
  end

end
