class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  #def destroy
   # item = Item.find(params[:id])
   # item.destroy
   # redirect_to root_path
  #end

  #def edit
  #end

  #def update
   # item = Item.find(params[:id])
   # item.update(item_params)
   # redirect_to root_path
  #end

  #def show
  #end

  private

  def item_params
    params.require(:item).permit(:nickname, :image, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_time_id, :price).merge(user_ide: current_user.id)
  end

  #def move_to_index
   # return if user_signed_in?

  #  redirect_to action: :index
  #end
end
