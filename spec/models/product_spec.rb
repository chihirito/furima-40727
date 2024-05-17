require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  
  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '全ての項目が存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'imageが空では出品できない' do
        @product.image = nil 
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @product.description = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では出品できない' do
        @product.category_id = nil 
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では出品できない' do
        @product.condition_id = nil 
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが1では出品できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_idが空では出品できない' do
        @product.shipping_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'shipping_fee_idが1では出品できない' do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが空では出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_duration_idが空では出品できない' do
        @product.shipping_duration_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping duration can't be blank")
      end

      it 'shipping_duration_idが1では出品できない' do
        @product.shipping_duration_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping duration can't be blank")
      end

      it 'priceが空では出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが数値でないと出品できない' do
        @product.price = 'abc'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
