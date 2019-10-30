# $ bin/rspec spec/features/contact.spec.rb

require 'rails_helper'

RSpec.feature "お問い合わせに関する機能", type: :feature do
  scenario "お問い合わせ投稿のテスト（ログイン済みver）" do
    FactoryBot.create(:test_user1)
    visit new_user_session_path
    ## test_user1でログイン
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    click_on 'ログイン' # => マイページへリダイレクト
    click_on "お問い合わせ"
    fill_in 'contact_name', with: 'テストユーザ1(admin)'
    fill_in 'contact_email', with: 'test1@example.com'
    fill_in 'contact_content', with: 'テスト1'
    click_on "送信"
    expect(page).to have_content 'お問い合わせを受け付けました。'
    expect(page).to have_content 'マイページ'
  end

  scenario "お問い合わせ投稿のテスト（未ログインver）" do
    visit new_user_session_path
    click_on "お問い合わせ"
    fill_in 'contact_name', with: '部外者'
    fill_in 'contact_email', with: 'hogehoge@example.com'
    fill_in 'contact_content', with: 'テスト2'
    click_on "送信"
    expect(page).to have_content 'お問い合わせを受け付けました。'
    expect(page).to have_content 'ログイン'
  end
end
