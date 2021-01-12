class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || Order.find_by(item_id: @item.id)
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :block, :building, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
