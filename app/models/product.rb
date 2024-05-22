class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :shipping_fee
  has_many :shipments, through: :order

  SHIPPING_FEES = {
    1 => '送料込み(出品者負担)',
    2 => '着払い(購入者負担)'
  }

  def sold_out?
    #orders.exists?
  end

  def shipping_fee_text
    SHIPPING_FEES[self.shipping_fee_id]
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :shipping_fee
  has_one_attached :image

  validates :image, presence: { message: "can't be blank" }
  validates :name, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }, numericality: { only_integer: true, message: 'is not a number' }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
end
