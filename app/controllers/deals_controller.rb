class DealsController < ApplicationController

  def index
    @deals = Deal.where("user_id = ? AND product_id = ?", current_user, params[:product_id])
  end

  def create

  end

  private
  def deals_params
    params.require(:deal).permit(:user_id, :product_id)
  end
end
