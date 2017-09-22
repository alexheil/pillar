class Artists::ThemesController < ApplicationController

	before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

	def edit
		@theme = @artist.artist_theme
	end

	def update
		@theme = @artist.artist_theme
    if @theme.update_attributes(theme_params)
      flash[:notice] = "You've successfully updated your theme!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "You failed to update your theme."
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
        flash[:alert] = "This is not your theme."
      end
		end

		def theme_params
			params.require(:artist_theme).permit(:main_color, :text_color, :background_color, :link_color)
		end

end