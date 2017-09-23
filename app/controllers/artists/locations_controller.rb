class Artists::LocationsController < ApplicationController

before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @location = @artist.artist_location
  end

  def update
    @location = @artist.artist_location
    if @location.update_attributes(location_params)
      flash[:notice] = "You've successfully updated your location!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "You failed to update your location."
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = Artist.friendly.find(params[:artist_id])
      if current_artist != @artist
        redirect_to artist_path(@artist)
        flash[:alert] = "This is not your location."
      end
    end

    def location_params
      params.require(:artist_location).permit(:city, :state, :year)
    end

end