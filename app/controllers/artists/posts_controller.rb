class Artists::PostsController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_post_artist, only: :destroy
  before_action :set_artist, except: :show

  def show
  end

  def create
    @post = @artist.artist_posts.build(post_params)
    if @post.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a post!"
      @artist.fan_post_email
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def destroy
    ArtistPost.find(params[:id]).destroy
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

    def correct_post_artist
      @post = ArtistPost.find(params[:id])
      redirect_to artist_path(@post.artist_id) if @post.artist_id != current_artist.id
    end

    def post_params
      params.require(:artist_post).permit(:content, :link)
    end

end