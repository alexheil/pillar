class Artists::ToursController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_photo_artist, only: :destroy
  before_action :set_artist, except: :show

	def show
  end

  def new
  end

  def create
    @tour = @artist.artist_tours.build(tour_params)
    if @tour.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a tour!"
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
    ArtistTour.friendly.find(params[:id]).destroy
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
      @tour = ArtistTour.friendly.find(params[:id])
      redirect_to artist_path(@tour.artist_id) if @tour.artist_id != current_artist.id
    end

    def photo_params
      params.require(:artist_tour).permit(:title, :photo, :description, :cover_photo, :profile_photo)
    end
end