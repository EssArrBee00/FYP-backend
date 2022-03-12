class AddProductSubCategoryIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_sub_category_id, :integer
  end
end
