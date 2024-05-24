require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order = FactoryBot.build(:order, user_id: @user.id, product_id: @product.id)
  end

  context '内容に問題ない場合' do
    it '必要な情報があれば保存ができること' do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'user_idが空では登録できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it 'product_idが空では登録できないこと' do
      @order.product_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Product can't be blank")
    end
  end

end
