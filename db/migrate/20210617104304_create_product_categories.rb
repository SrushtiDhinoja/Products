class CreateProductCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_categories do |t|
      t.string :cname
      t.references :product_category_heading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
