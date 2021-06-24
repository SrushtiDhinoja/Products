module ProductCategoryHeadingsHelper
  def product_category(product_category_heading)
    product_category_heading&.product_categories&.join(",")
  end
end
