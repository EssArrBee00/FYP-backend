class AddUserIdToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :user_id, :integer
  end
end
