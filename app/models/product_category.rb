class ProductCategory < ApplicationRecord
  has_many :product_sub_categories, dependent: :destroy
  belongs_to :product_type
  belongs_to :user
end
