class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :non_purchase, only: [:edit, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
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
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
      @item.destroy
      redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id, :price, :item_image).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 出品者とログインしているユーザーが一緒じゃない場合、またはsold Outの時は編集・削除は不可
  def non_purchase
    redirect_to root_path if @item.user.id !=  current_user.id || @item.purchase.present?
  end

end