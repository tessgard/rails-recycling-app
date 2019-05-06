class ProductsController < ApplicationController
  authorize_resource
  def index
      @products = Product.all

      @products.each do |product|
        if product.category == "Glass"
          @image_name = "glass.jpg"
        elsif product.category == "Cardboards"
          @image_name = "cardboard.jpg"
        end
      end
  end

  def create
      @product = Product.new(product_params)
      @product.user_id = current_user.id
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
      @transaction = Transaction.new
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
    if @product.user == current_user

      @product.destroy
   
      redirect_to user_dashboard_path
    else
      redirect_to product_path
    end

  end

  def filter_cat
    category = params[:category]
    @products = Product.where(category: category)
    render 'index'
  end

  def filter_loc
    location = params[:location]
    @products = Product.where(location: location)
    render 'index'
  end


  def cart
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.permit(:category, :quantity, :location,  :uploaded_image)
    end
end
