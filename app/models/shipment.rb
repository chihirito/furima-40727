class Shipment < ApplicationRecord
  belongs_to :oder
  validates :postal_code, :prefecture_id, :city, :street_address, :phone_number, presence: true
end
