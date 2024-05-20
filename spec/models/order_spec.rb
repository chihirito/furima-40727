require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'オーダーのバリデーション' do
    it 'すべての属性が存在すれば有効である' do
      expect(@order).to be_valid
    end
  end
end
