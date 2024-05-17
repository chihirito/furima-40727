class RemoveCategoryFromProducts < ActiveRecord::Migration[7.0]
  def change
    #The following migration was a mistake
    #remove_column :products, :category_id, :integer
  end
end
