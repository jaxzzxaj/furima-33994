require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end


  describe "出品" do
    context "出品できる場合" do
      it "すべてを入力する" do
        expect(@product).to be_valid
      end

      it "価格は300以上9999999以下であり、半角数字のみで入力する" do
        @product.price           = '599'
      end
    end

    context "出品できない場合" do
      it "imageが空だと不可" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと不可" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "textが空だと不可" do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it "category_idが空だと不可" do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "category_idが0だと不可" do
        @product.category_id = '0'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 0")
      end

        it "product_condition_idが空だと不可" do
          @product.product_condition_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Product condition is not a number", "Product condition can't be blank")
        end

          it "product_condition_idが0だと不可" do
          @product.product_condition_id = '0'
          @product.valid?
          expect(@product.errors.full_messages).to include("Product condition must be other than 0")
        end

          it "shipping_charges_idが空だと不可" do
        @product.shipping_charges_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charges is not a number", "Shipping charges can't be blank")
        end

          it "shipping_charges_idが0だと不可" do
        @product.shipping_charges_id = '0'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charges must be other than 0")
        end

          it "prefecture_idが空だと不可" do
          @product.prefecture_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Prefecture can't be blank")
        end

        it "prefecture_idが0だと不可" do
          @product.prefecture_id = '0'
          @product.valid?
          expect(@product.errors.full_messages).to include("Prefecture must be other than 0")
        end

        it "estimated_shipping_date_idが空だと不可" do
          @product.estimated_shipping_date_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Estimated shipping date is not a number", "Estimated shipping date can't be blank")
        end

        it "estimated_shipping_date_idが0だと不可" do
          @product.estimated_shipping_date_id = '0'
          @product.valid?
          expect(@product.errors.full_messages).to include("Estimated shipping date must be other than 0")
        end

        it "priceが空だと不可" do
          @product.price = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが299以下だと不可" do
          @product.price = '100'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than 300")
        end

        it "priceが10000000以上だと不可" do
          @product.price = '10000000'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than 9999999")
        end

        it "priceが全角数字だと不可" do
          @product.price = '１０００'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it "priceが英字だと不可" do
          @product.price = "abcdef"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
      end
  end
end

