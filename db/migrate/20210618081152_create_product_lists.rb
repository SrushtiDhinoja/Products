class CreateProductLists < ActiveRecord::Migration[6.1]
  def change
    create_table :product_lists do |t|
      t.string :product_name
      t.references :product_category, null: false, foreign_key: true


      t.timestamps
    end
  end
end
