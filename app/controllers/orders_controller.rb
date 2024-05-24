class OrdersController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!
  before_action :set_product
  before_action :check_user, only: [:index, :create]
  before_action :check_sold_out, only: [:index, :create]

  def index
    gon.public_key = ENV.fetch('PAYJP_PUBLIC_KEY', nil)
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      gon.public_key = ENV.fetch('PAYJP_PUBLIC_KEY', nil)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, product_id: @product.id
    )
  end

  def pay_item
    Payjp.api_key = ENV.fetch('PAYJP_SECRET_KEY', nil)
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def check_user
    return unless @product.user_id == current_user.id

    redirect_to root_path
  end
end

def check_sold_out
  return unless @product.sold_out?

  redirect_to root_path
end
