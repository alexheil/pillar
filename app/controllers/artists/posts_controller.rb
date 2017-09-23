class Artists::PostsController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def show
  end

  def create
    @post = @artist.artist_posts.build(post_params)
    if @post.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a post!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def destroy
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

    def post_params
      params.require(:artist_post).permit(:content, :link)
    end

end