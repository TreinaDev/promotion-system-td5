class ProductCategory < ApplicationRecord
  has_many :product_category_promotions
  has_many :promotions, through: :product_category_promotions
end
