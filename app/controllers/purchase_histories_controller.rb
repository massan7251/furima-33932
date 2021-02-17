class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @destination_purchase_history = DestinationPurchaseHistory.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase_history = DestinationPurchaseHistory.new(destination_params)
    if @destination_purchase_history.valid?
      @destination_purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def destination_params
    params.require(:destination_purchase_history).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end

end
