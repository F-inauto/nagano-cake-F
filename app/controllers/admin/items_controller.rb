class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = new
    @item.save
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update
  end

  def destroy
    @items = Item.all
    @item = Item.find(params[:id])
    @item.destroy

  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
    end

end
