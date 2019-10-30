# $ bin/rspec spec/models/contact_spec.rb

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "「名前(name)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    contact = Contact.new(name: '', email: 'test1@example.com', content: 'テスト', user_id: 1)
    expect(contact).not_to be_valid
  end

  it "「メールアドレス(email)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    contact = Contact.new(name: 'テストユーザ1', email: '', content: 'テスト', user_id: 1)
    expect(contact).not_to be_valid
  end

  it "「お問い合わせ内容(content)」が空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    contact = Contact.new(name: 'テストユーザ1', email: 'test1@example.com', content: '', user_id: 1)
    expect(contact).not_to be_valid
  end


  it "「名前(name)・メールアドレス(email)・お問い合わせ内容(content)」の全てが記載されていればバリデーションが通る" do
    FactoryBot.create(:test_user1)
    contact = Contact.new(name: 'テストユーザ1', email: 'test1@example.com', content: 'テスト', user_id: 1)
    expect(contact).to be_valid
  end
end
