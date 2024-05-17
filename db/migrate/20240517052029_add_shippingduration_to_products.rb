class AddShippingdurationToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :shipping_duration_id, :integer
  end
end
