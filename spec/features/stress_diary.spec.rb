# $ bin/rspec spec/features/stress_diary.spec.rb

require 'rails_helper'

RSpec.feature "ストレスダイアリーに関する機能", type: :feature do
  background do
    # テストユーザ
    FactoryBot.create(:test_user1)

    # ログイン処理
    visit new_user_session_path
    ## test_user1でログイン
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
  end

  scenario "ストレスダイアリー一覧のテスト" do
    FactoryBot.create(:stress_diary1)
    FactoryBot.create(:stress_diary2)
    click_on "一覧"
    expect(page).to have_content 'テスト1'
    expect(page).to have_content 'テスト2'
  end

  scenario "ストレスダイアリー作成のテスト" do
    click_on "新規投稿"
    select '10', from: 'stress_diary_time_4i'
    select '30', from: 'stress_diary_time_5i'
    select '5', from: 'stress_diary_stress_level'
    select '10〜20分', from: 'stress_diary_duration'
    fill_in 'stress_diary_situation', with: 'テスト'
    fill_in 'stress_diary_trigger', with: 'テスト'
    fill_in 'stress_diary_reaction', with: 'テスト'
    click_on "投稿"
    expect(page).to have_content 'ストレスダイアリーを投稿しました'
    expect(page).to have_content 'テスト'
  end

  scenario "ストレスダイアリー編集のテスト" do
    FactoryBot.create(:stress_diary1)
    click_on "一覧"
    click_on "編集"
    fill_in 'stress_diary_situation', with: '編集テスト'
    click_on "投稿"
    expect(page).to have_content 'ストレスダイアリーを更新しました'
    expect(page).to have_content '編集テスト'
  end

  scenario "ストレスダイアリー削除のテスト" do
    FactoryBot.create(:stress_diary1)
    click_on "一覧"
    click_link "削除", match: :first
    expect(page).to have_content 'ストレスダイアリーを削除しました'
    expect(page).not_to have_content 'テスト1'
  end
end
