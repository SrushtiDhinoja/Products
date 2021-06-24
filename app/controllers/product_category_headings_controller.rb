class ProductCategoryHeadingsController < ApplicationController
  before_action :set_product_category_heading, only: %i[ show edit update destroy ]

  def index
    @product_category_headings = ProductCategoryHeading.all
  end

  def show
    redirect_to product_category_headings_path
  end

  def new
    @product_category_heading = ProductCategoryHeading.new
  end

  def edit
  end

  def create
    @product_category_heading = ProductCategoryHeading.new(product_category_heading_params)
      if @product_category_heading.save
        redirect_to @product_category_heading, notice: "Article was successfully created." 
      else
          render :new, status: :unprocessable_entity 
      end
  end

  def update
      if @product_category_heading.update(product_category_heading_params)
        redirect_to @product_category_heading, notice: "Article was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
    @product_category_heading.destroy
     redirect_to product_category_headings_path, notice: "Article was successfully destroyed." 
  
  end

  private
    def set_product_category_heading
      @product_category_heading = ProductCategoryHeading.find(params[:id])
    end

    def product_category_heading_params
      params.require(:product_category_heading).permit(:category_heading, product_categories_attributes: [:id, :cname, :_destroy])
    end
end
