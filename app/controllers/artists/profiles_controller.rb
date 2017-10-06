class Artists::ProfilesController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @profile = @artist.artist_profile
    @theme = @artist.artist_theme
    @location = @artist.artist_location
    @genre = @artist.artist_genre
    @member = ArtistMember.new
  end

  def update
    @profile = @artist.artist_profile
    @location = @artist.artist_location
    @theme = @artist.artist_theme
    @genre = @artist.artist_genre
    @location.update_attributes(location_params)
    @theme.update_attributes(theme_params)
    @genre.update_attributes(genre_params)
    if @profile.update_attributes(profile_params)
      flash[:notice] = "You've successfully updated your profile!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "You failed to update your profile."
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
        flash[:alert] = "This is not your profile."
      end
    end

    def profile_params
      params.require(:artist_profile).permit(:biography, :year_founded, :email, :website_url, :facebook_handle, :facebook_url, :twitter_handle, :twitter_url, :instagram_handle, :instagram_url, :youtube_handle, :youtube_url, :letlyrics_url, :record_label, :influences, :general_manager_name, :general_manager_email, :press_contact_name, :press_contact_email, :booking_agent_name, :booking_agent_email)
    end

    def location_params
      params.require(:artist_location).permit(:city, :state, :year)
    end

    def genre_params
      params.require(:artist_genre).permit(:genre, :subgenre)
    end

    def theme_params
      params.require(:artist_theme).permit(:main_color, :text_color, :background_color, :link_color)
    end

end