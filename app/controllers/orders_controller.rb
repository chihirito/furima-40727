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
      Payjp.api_key = "sk_test_2fdb4780df8f3a2a381d14b5"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_form.save
      redirect_to root_path
    els
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, product_id: @product.id)
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
