class AddPrefectureToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :prefecture_id, :integer
  end
end
