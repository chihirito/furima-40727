class AddConditionToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :condition_id, :integer
  end
end
