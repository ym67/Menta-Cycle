# $ bin/rspec spec/features/big5_score.spec.rb

require 'rails_helper'

RSpec.feature "Big5診断に関する機能", type: :feature do
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

  scenario "Big5診断のテスト" do
    click_on "Big5を診断する"
    click_on "診断"
    expect(page).to have_content '戻る'
    # 「Big5診断結果」のテキストはjsで描写されている為、補足不可
  end
end
