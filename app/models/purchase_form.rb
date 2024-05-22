class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :product_id
    validates :postal_code, presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}, length: { in: 10..11, message: "is too short" }
  end
  

  def save
    order = Order.create(user_id: user_id, product_id: product_id)

    Shipment.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end