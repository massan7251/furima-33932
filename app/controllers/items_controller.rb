class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :restriction_user, only: [:show, :edit, :destory]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :status_id, :burden_id, :prefecture_id, :shipment_id).merge(user_id: current_user.id)
  end

  def restriction_user
    unless user_signed_in?
      redirect_to user_session_path
    end
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
