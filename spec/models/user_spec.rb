require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,first_name_full_widthとlast_name_full_width,
        first_name_katakanaとlast_name_katakana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'jjjgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは半角英数字でないと登録できない' do
        @user.password = 'アイウエオカキク'
        @user.password_confirmation = 'アイウエオカキク'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは数字のみだと登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'qqqw'
        @user.password_confirmation = 'qqqw'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'rrrruuuu222'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'first_name_full_widthが空だと登録できない' do
        @user.first_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full width can't be blank")
      end
      it 'first_name_full_widthは全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.first_name_full_width = 'ffff'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full width is invalid')
      end
      it 'last_name_full_widthが空だと登録できない' do
        @user.last_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full width can't be blank")
      end
      it 'last_name_full_widthは全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.last_name_full_width = 'wwww'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name full width is invalid')
      end
      it 'first_name_katakanaは空だと登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'first_name_katakanaは半角だと登録できない' do
        @user.first_name_katakana = 'ﾖﾛｸｼｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'first_name_katakanaが全角(カタカナ)でないと登録できないだと登録できない' do
        @user.first_name_katakana = 'やまもと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'last_name_katakanaは空だと登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'last_name_katakanaは半角だと登録できない' do
        @user.last_name_katakana = 'ｶｶｶｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid')
      end
      it 'last_name_katakanaが全角(カタカナ)でないと登録できない' do
        @user.last_name_katakana = 'しんじろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
