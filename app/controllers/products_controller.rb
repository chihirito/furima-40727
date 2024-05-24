class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_sold_out, only: [:edit, :update, :destroy]

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
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

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def check_user
    return unless @product.user_id != current_user.id

    redirect_to root_path
  end

  def check_sold_out
    return unless @product.sold_out?

    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id,
                                    :prefecture_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return unless @product && (!user_signed_in? || current_user != @product.user)

    redirect_to root_path
  end
end
