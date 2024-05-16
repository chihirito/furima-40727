class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreifn_key: true
      t.references :user, null: false, foreifn_key: true
      t.timestamps
    end
  end
end
