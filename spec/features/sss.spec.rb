# $ bin/rspec spec/features/sss.spec.rb

require 'rails_helper'

RSpec.feature "ストレス計測（詳細版）に関する機能", type: :feature do
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

  scenario "ストレス計測（詳細版）のテスト" do
    click_on "詳細版"
    click_on "診断"
    expect(page).to have_content '0%'
  end
end
