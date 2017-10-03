class Artists::ShowsController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_photo_artist, only: :destroy
  before_action :set_artist, except: :show

	def show
  end

  def new
  end

  def create
    @tour = ArtistTour.friendly.find(params[:tour_id])
    @show = @tour.artist_shows.build(show_params)
    @show.artist_id = @artist.id
    if @show.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a show!"
      @artist.fan_show_email
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
    ArtistShow.friendly.find(params[:id]).destroy
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

    def correct_photo_artist
      @show = ArtistShow.friendly.find(params[:id])
      redirect_to artist_path(@show.artist_id) if @show.artist_id != current_artist.id
    end

    def photo_params
      params.require(:artist_show).permit(:title, :photo, :description, :cover_photo, :profile_photo)
    end
end