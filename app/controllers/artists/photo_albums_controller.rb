class Artists::PhotoAlbumsController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_post_artist, only: :destroy
  before_action :set_artist, except: :show

  def show
  end

  def new
  end

  def create
    @photo_album = @artist.artist_photo_albums.build(photo_album_params)
    if @photo_album.save
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
    ArtistPhotoAlbum.find(params[:id]).destroy
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

    def correct_photo_album_artist
      @photo_album = ArtistPhotoAlbum.find(params[:id])
      redirect_to artist_path(@photo_album.artist_id) if @photo_album.artist_id != current_artist.id
    end

    def photo_album_params
      params.require(:artist_photo_albums).permit(:title)
    end

end