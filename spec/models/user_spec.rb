require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録がうまくいくとき' do
      it '全て入力できていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'ユーザー名が7文字以上だと登録できない' do
        @user.name = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is too long (maximum is 6 characters)')
      end

      it 'ユーザー名が全角だと登録できない' do
        @user.name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemaleがあると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordがないと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは英数字混合でないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは6文字以上でないと登録できない' do
        @user.password = '11aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
