class Public::ItemsController < ApplicationController

  def index
    #ジャンルIDあるとき
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
    #ジャンルIDないとき
    else
      @items = Item.all.page(params[:page]).per(8)
    end

  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end


  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :item_image, :introduction, :price, :is_active)
    end


end
