class Product < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :product_sub_category
end
