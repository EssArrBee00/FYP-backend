class AddProductTypeIdToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :product_type_id, :integer
  end
end
