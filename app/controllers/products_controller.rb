class ProductsController < ApplicationController
  def index
    @products = current_user.products
  end

  def splash; end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:notice] = 'Created new product'
      redirect_to products_path
    else
      flash[:alert] = 'Cannot create new product'
      redirect_to request.referrer
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :amount, :image)
  end
end
