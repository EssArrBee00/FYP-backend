class ProductSubCategory < ApplicationRecord
  has_many :products
  belongs_to :product_category
  belongs_to :user
end
