class RemoveShippingdurationFromProducts < ActiveRecord::Migration[7.0]
  def change
    #The following migration was a mistake
    #remove_column :products, :shipping_duration_id, :integer
  end
end
