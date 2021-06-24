class ProductListsController < ApplicationController
  before_action :set_product_category, only: %i[ show new create edit update destroy ]
  before_action :set_product_list, only: %i[ show edit update destroy ]
  def index
    @product_category = ProductCategory.find(params[:product_category_id])
    @product_lists = @product_category.product_lists 
  end
  def product_list
    @product_category_heading = ProductCategory.find_by(product_category_heading_id: params[:id]).product_category_heading
    @products = @product_category_heading.product_lists
  end

  def show
  end
  def new
    @product_list = @product_category.product_lists.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  def create
    @product_list = @product_category.product_lists.create(product_name: params[:product_name])
    if @product_list.save
      redirect_to product_category_path(@product_category)
    else
      render :new
    end
  end
  def edit   

  end

  def update
    if @product.update(product_params)
      redirect_to product_category_path(@product_category)
    else
      render :edit
    end
  end
  def destroy
    @product.destroy
    redirect_to product_category_path(@product_category)
  end
  private
  def set_product_category
    @product_category = ProductCategory.find(params[:product_category_id])
  end
  def set_product_list
    @product = ProductList.find(params[:id])
  end
  def product_params
    params.require('product_list').permit(:product_name);
  end
end
