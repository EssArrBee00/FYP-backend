class CreateProductSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sub_categories do |t|
      t.string :name
      t.integer :product_category_id

      t.timestamps
    end
  end
end
