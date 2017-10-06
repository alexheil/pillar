class Artists::ItemsController < ApplicationController

	before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_item_artist, only: [:edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    @item = @artist.artist_items.build(item_params)
    if @item.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a item!"
      #@artist.fan_item_email
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
  end

  def update
    @item = ArtistItem.friendly.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to artist_path(@artist)
      flash[:notice] = "you've successfully updated your item!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @item = ArtistItem.friendly.find(params[:id]).destroy
    redirect_to artist_path(@artist)
  end

  private

  	def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_item_artist
      @item = ArtistItem.friendly.find(params[:id])
      redirect_to artist_path(@item.artist_id) if @item.artist_id != current_artist.id
    end

    def item_params
      params.require(:artist_item).permit(:title, :description, :category, :base_price, :shipping_price, :currency, :total_price, :quantity, :options, :image, :image_two, :image_three, :return_policy, :shipping_info, :slug)
    end
end