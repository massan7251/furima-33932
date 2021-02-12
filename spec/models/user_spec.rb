require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
context '新規登録できるとき' do
  it 'name,email,password,assword_confirmation,first_name,last_name,first_name_kana,last_name,kana,birthdayが存在すれば登録できる' do
    expect(@user).to be_valid
  end
  it 'passwordpasswordとpassword_confirmationが6文字以上であれば登録できる' do
    @user.password = 'abc123'
    @user.password_confirmation = 'abc123'
    expect(@user).to be_valid
  end
end
context '新規登録できないとき' do
  it 'nameが空では登録できない' do
    @user.name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'emailに@マークがないと登録できない' do
    @user.email = 'test/example'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end
  it 'firsu_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  it 'last_name_kanaが存在してもカナ文字でなければ登録できない' do
    @user.last_name_kana = 'ひらがな'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
  end
  it 'firsu_name_kanaが存在してもカナ文字でなければ登録できない' do
    @user.first_name_kana = 'ひらがな'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
  end
  it 'last_name_kanaが存在しても半角文字では登録できない' do
    @user.last_name_kana = 'ﾊﾝｶｸ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
  end
  it 'first_name_kanaが存在しても半角文字では登録できない' do
    @user.first_name_kana = 'ﾊﾝｶｸ'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
  end
  it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
  end
  it 'passwordが英語だけでは登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが数字だけでは登録できない' do
    @user.password = '111111'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが5文字以下であれば登録できない' do
    @user.password = 'aaa11'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
end
end
end