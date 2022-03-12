class OrderItem < ApplicationRecord
    belongs_to :product
    belongs_to :order
    vlidates :quantity_available


    def quantity_available
    end
    








end