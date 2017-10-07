class Artists::AlbumsController < ApplicationController
	
	before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_album_artist, only: :destroy
  before_action :set_artist, except: :show

  def show
  end

  def new
  end

  def create
    @album = @artist.artist_albums.build(album_params)
    if @album.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a photo album!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    ArtistAlbum.friendly.find(params[:id]).destroy
    redirect_to artist_path(@artist)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = Artist.friendly.find(params[:artist_id])
      if current_artist != @artist
        redirect_to artist_path(@artist)
        flash[:alert] = "This is not your profile."
      end
    end

    def correct_album_artist
      @album = ArtistAlbum.friendly.find(params[:id])
      redirect_to artist_path(@album.artist_id) if @album.artist_id != current_artist.id
    end

    def album_params
      params.require(:artist_album).permit(:title, :description, :release_month, :release_day, :release_year, :price, :currency, :image)
    end
end