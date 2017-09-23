class Artists::GenresController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @genre = @artist.artist_genre
  end

  def update
    @genre = @artist.artist_genre
    if @genre.update_attributes(genre_params)
      flash[:notice] = "You've successfully updated your genre!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "You failed to update your genre."
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

    def genre_params
      params.require(:artist_genre).permit(:genre, :subgenre)
    end

end