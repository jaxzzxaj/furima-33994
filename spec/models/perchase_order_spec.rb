require 'rails_helper'

RSpec.describe PerchaseOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user_id: @user.id)
    @product.save
    @perchase_order = FactoryBot.build(:perchase_order, user_id: @user.id, product_id: @product.id)
    sleep 1
  end


  describe '購入' do
    context '購入できる場合' do
      it '購入するたびに記入欄すべてを入力する' do
        expect(@perchase_order).to be_valid
      end

      it '購入するたびに建物名の記述無しで購入する' do
        @perchase_order.building_name = ""
        expect(@perchase_order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'zip_codeが空だと不可' do
        @perchase_order.zip_code = ''
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Zip code can't be blank",
                                                                'Zip code is invalid,Input half-width numbers with hyphen')
      end

      it 'zip_codeにハイフンがないと不可' do
        @perchase_order.zip_code = 1_231_234
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include('Zip code is invalid,Input half-width numbers with hyphen')
      end

      it 'prefecture_idは空だと不可' do
        @perchase_order.prefecture_id = ''
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank",
                                                                'Prefecture is not a number')
      end

      it 'prefecture_idが0だと不可' do
        @perchase_order.prefecture_id = 0
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'municipalityは空だと不可' do
        @perchase_order.municipality = ''
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'adressは空と不可' do
        @perchase_order.adress = ''
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Adress can't be blank")
      end

      it 'phone_numberは空だと不可' do
        @perchase_order.phone_number = ''
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is not a number")
      end

      it 'phone_numberは数値のみ' do
        @perchase_order.phone_number = '090123123a'
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Phone number is not a number")
      end

      it 'phone_numberは12桁以上だと購入できない' do
        @perchase_order.phone_number = '0901111222233334444'
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'Product_idが空では購入できないこと' do
        @perchase_order.product_id = nil
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Product can't be blank")
      end

      it 'User_idが空では購入できないこと' do
        @perchase_order.user_id = nil
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @perchase_order.token = nil
        @perchase_order.valid?
        expect(@perchase_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end