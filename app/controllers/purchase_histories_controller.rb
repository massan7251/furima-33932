class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :restriction_user
  before_action :item_sold

  def index
    @destination_purchase_history = DestinationPurchaseHistory.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase_history = DestinationPurchaseHistory.new(destination_params)
    if @destination_purchase_history.valid?
      pay_item
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
    params.require(:destination_purchase_history).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: destination_params[:price],
        card: destination_params[:token],
        currency: 'jpy'
      )
  end

  def restriction_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_sold
    if @item.purchase_history.present?
      redirect_to root_path
    end
  end

end
