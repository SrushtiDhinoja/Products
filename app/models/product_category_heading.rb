class ProductCategoryHeading < ApplicationRecord
  has_many :product_categories, inverse_of: :product_category_heading , dependent: :destroy
  has_many :product_lists, through: :product_categories,  dependent: :destroy
  accepts_nested_attributes_for :product_categories, reject_if: :all_blank, allow_destroy: true
  validates :category_heading , presence: true
end
