 class ProductList < ApplicationRecord
  belongs_to :product_category

  validates :product_name, presence: true
end
