class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: ture do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
  end
  

  def save
    order = Order.create(user_id: user_id, product_id: product_id)

    Shipment.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end