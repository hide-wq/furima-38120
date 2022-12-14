class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :agreement_userid_editor, only: [:edit, :destroy]
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id || @item.order.nil?
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def agreement_userid_editor
    unless  @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end
