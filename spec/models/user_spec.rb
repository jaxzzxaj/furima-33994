require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "新規登録" do
    context "新規登録できる場合" do
      it "すべて入力をする" do
        # expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "nicknameが空だと不可" do
        # @user.nickname = ''
        # @user.valid?
        # expect(@user.errors[:nickname]).to include('を入力してください')
      end

      it "emailが空だと不可" do
        # @user.email = ''
        # @user.valid?
        # expect(@user.errors[:email]).to include('を入力してください')
      end

      it "emailは重複してはならない" do
        # @user.save
        # another_user = FactoryBot.build(:user)
        # another_user.email = @user.email
        # another_user.valid?
        # expect(another_user.errors.full_messages).to include('このメールはもう使われています')
      end

      it "emailは＠を含む必要がある" do
        # @user = build(:user, email: 'aaaaabb')
        # @user.valid?
        # expect(@user.errors[:email]).to include('メールには＠が必須です')
      end

      it "passwordが空だと不可" do
        # @user.password = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('パスワードは空だと不可です')
      end

      it "passwordは6文字以上の入力が必要" do
        # @user.password = '00000'
        # @user.password_confirmation = '00000'
        # @user.valid?
        # expect(@user.errors.full_messages).to include('パスワードは６文字以上での入力が必要です')
      end

      it "passwordと確認用passwordの値は一致であること" do
        # @user = build(:user, encrypted_password: '')
        # @user.valid?
        # expect(@user.errors[:password_confirmation]).to include('パスワードと確認用パスワードの値は一致でなければならない')
      end

      it "名字が空だと不可" do
        # @user.family_name = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('名字は空だと不可です')
      end

      it "名前が空だと不可" do
        # @user.second_name= ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('名前は空だと不可です')
      end

      it "カナ表記の名字が空だと不可" do
        # @user.reader_family_name = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('カナ表記/名字は空だと不可です')
      end

      it "カナ表記の名前が空だと不可" do
      #   @user.reader_second_name = ''
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('カナ表記/名前は空だと不可です')
      end

      it "誕生年が空だと不可" do
        # @user.birth_y = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('誕生年は空だと不可です')
      end

      it "誕生月が空だと不可" do
        # @user.birth_m = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('誕生月は空だと不可です')
      end

      it "誕生日が空だと不可" do
        # @user.birth_d= ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include('誕生日は空だと不可です')
      end
    end
  end
end
