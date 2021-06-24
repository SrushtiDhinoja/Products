class ProductCategory < ApplicationRecord
  belongs_to :product_category_heading
  has_many :product_lists , dependent: :destroy

  validates :cname, presence: true
end
