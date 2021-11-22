class DealsController < ApplicationController

  def index
    # @deals = Deal.where("user_id = ?", current_user)
    @product = Product.find(params[:product_id])
  end

  def new
    @deal = Deal.new()
  end

  def create

  end

  private
  def deals_params
    params.require(:deal).permit(:user_id, :product_id)
  end
end
