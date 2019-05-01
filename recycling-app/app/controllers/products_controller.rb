class ProductsController < ApplicationController
  authorize_resource
  def index
      @products = Product.all
  end

  def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product
      else
        render 'new'
      end
       
            
  end

  def new
      @product = Product.new
       
  end

  def show
      @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
          redirect_to @product
        else
          render 'edit'
        end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
   
    redirect_to products_path
  end

  def cart
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.permit(:category, :quantity, :location,  :uploaded_image)
    end
end
