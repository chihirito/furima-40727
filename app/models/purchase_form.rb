class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  end

  def save
    order = Order.create(user_id:, product_id:)
    return unless order.persisted?

    Shipment.create(
      postal_code:,
      prefecture_id:,
      city:,
      street_address:,
      building_name:,
      phone_number:,
      order_id: order.id
    )
  end
end
