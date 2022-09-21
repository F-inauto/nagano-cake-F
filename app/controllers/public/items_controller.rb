class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end


  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :item_image, :introduction, :price, :is_active)
    end


end
