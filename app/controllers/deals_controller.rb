class DealsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @deals = @product.deals.order(created_at: :desc)
    @total_amount = @deals.map{|d| @product.amount * d.quantity}.inject{ |sum, n| sum + n }
  end

  def new
    @deal = Deal.new()
  end

  def create
    @deal = current_user.deals.build(deals_params)

    if @deal.save
      flash[:notice] = 'Created new deal'
      redirect_to product_deals_path
    else
      flash[:alert] = 'Cannot create new deal'
      redirect_to request.referrer
    end
  end

  private
  def deals_params
    params.require(:deal).permit(:name, :quantity, :category)
  end
end
