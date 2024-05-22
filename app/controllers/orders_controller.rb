class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :check_user, only: [:index, :create]
  before_action :check_sold_out, only: [:index, :create]

  def index 
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token).merge(user_id: current_user.id, product_id: @product.id)
  end

  def check_user
    if @product.user_id == current_user.id
      redirect_to root_path
    end
  end

  def check_sold_out
    if @product.order.present?
      redirect_to root_path
    end
  end
end
