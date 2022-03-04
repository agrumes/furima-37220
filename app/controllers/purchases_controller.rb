class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchase, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  # 出品者とログインしているユーザーが一緒の場合、またはsold Outの時は購入画面へ遷移せずにトップページへ
  def non_purchase
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user.id ==  current_user.id || @item.purchase.present? 
  end 


end
