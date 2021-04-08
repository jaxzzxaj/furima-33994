require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "新規登録" do
    context "新規登録できる場合" do
      it "すべて入力をする" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "nicknameが空だと不可" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと不可" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは重複してはならない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは＠を含む必要がある" do
        @user = build(:user, email: 'aaaaabb')
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end

      it "passwordが空だと不可" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは6文字以上の入力が必要" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordと確認用passwordの値は一致であること" do
        @user = build(:user, encrypted_password: '')
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include()
      end

      it "パスワードは、半角英数字混合の入力が必須であること" do
        @user = build(:user, encrypted_password: '12345')
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include()
      end

      it "名字が空だと不可" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "名前が空だと不可" do
        @user.second_name= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end

      it "カナ表記の名字が空だと不可" do
        @user.reader_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reader family name can't be blank")
      end

      it "カナ表記の名前が空だと不可" do
        @user.reader_second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reader second name can't be blank")
      end

      it "ユーザ本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.family_name = "kanji"
        @user.second_name = "hiragana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "Second name is invalid. Input full-width characters.")
      end


      it "ユーザ本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.reader_family_name = "漢字"
        @user.reader_second_name = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Reader family name is invalid. Input full-width  katakana characters.", "Reader second name is invalid. Input full-width  katakana characters.")
      end

      it "誕生年が空だと不可" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "誕生月が空だと不可" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "誕生日が空だと不可" do
        @user.birthday= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
