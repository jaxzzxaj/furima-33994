require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入' do
    context '購入できる場合' do
      it '購入するたびに必要事項を入力する' do
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'zip_codeが空だと不可' do
      end

      it 'zip_codeにハイフンがないと不可' do
      end

      it 'zip_codeはハイフンありの7桁でなければならない' do
    end

      it 'zip_codeは数値のみ' do
      end

      it 'prefecture_idは空だと不可' do
      end

      it 'prefecture_idが0だと不可' do
      end

      it 'municipalityは空だと不可' do
      end

      it 'adressは空と不可' do
      end

      it 'phone_numberは空だと不可' do
      end

      it 'phone_numberは数値のみ' do
      end

      it 'phone_numberは11桁の数値のみ' do
      end
    end
  end
end
