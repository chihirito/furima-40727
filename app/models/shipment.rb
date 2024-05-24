class Shipment < ApplicationRecord
  belongs_to :order
  validates :postal_code, :prefecture_id, :city, :street_address, :phone_number, presence: true
end
