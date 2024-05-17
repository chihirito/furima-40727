class RemoveShippingFromProducts < ActiveRecord::Migration[7.0]
  def change
    #The following migration was a mistake
    #remove_column :products, :shipping_fee_id, :integer
  end
end
