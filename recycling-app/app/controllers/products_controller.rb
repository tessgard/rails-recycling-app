class ProductsController < ApplicationController
  authorize_resource
  def index
      @products = product.all
  end

  def create
      @product = product.new(product_params)

      @product.save
            
  end

  def new
      @product = product.new
  end

  def show
      @product = product.find(params[:id])
  end

  def edit
    @product = product.find(params[:id])
  end

  def update
        @product = product.find(params[:id])

        if @product.update(product_params)
          redirect_to @product
        else
          render 'edit'
        end
  end

  def delete
    @product = product.find(params[:id])
    @product.destroy
   
    redirect_to products_path
  end

  private
    def product_params
      params.permit(:title, :address, :description, :food_type, :uploaded_image)
    end
end
