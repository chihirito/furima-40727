class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  belongs_to :category 
  belongs_to :condition 
  belongs_to :prefecture 
  belongs_to :shipping_duration 
  belongs_to :shipping_fee 
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_duration_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
end
