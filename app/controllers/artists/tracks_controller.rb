class Artists::TracksController < ApplicationController
  
  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_track_artist, only: :destroy
  before_action :set_artist, except: :show

  def show
  end

  def new
  end

  def create
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = @album.artist_tracks.build(track_params)
    @track.artist_id = @artist.id
    if @track.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a track!"
      @artist.fan_track_email
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
    ArtistTrack.friendly.find(params[:id]).destroy
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

    def correct_track_artist
      @track = ArtistTrack.friendly.find(params[:id])
      redirect_to artist_path(@track.artist_id) if @track.artist_id != current_artist.id
    end

    def track_params
      params.require(:artist_track).permit(:title, :track_number, :price, :currency, :audio, :lyrics)
    end


end