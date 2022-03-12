class ProductType < ApplicationRecord
  has_many :product_categories, dependent: :destroy
end
