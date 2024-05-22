class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index 
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token).merge(user_id: current_user.id, product_id: @product.id)
  end
end
