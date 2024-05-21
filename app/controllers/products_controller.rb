class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  # product = Product.find(params[:id])
  # product.destroy
  # redirect_to root_path
  # end

  def edit
    @product = Product.find(params[:id])
  end

  # def update
  # product = Product.find(params[:id])
  # product.update(item_params)
  # redirect_to root_path
  # end

  private

  def product_params
    params.require(:product).permit(:nickname, :image, :name, :description, :category_id, :condition_id, :shipping_fee_id,
                                    :prefecture_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  # return if user_signed_in?

  #  redirect_to action: :index
  # end
end
