class Artists::VideosController < ApplicationController

	before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_video_artist, only: [:edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    @video = @artist.artist_videos.build(video_params)
    if @video.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a video!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
  end

  def update
    @video = ArtistVideo.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to artist_path(@artist)
      flash[:notice] = "you've successfully updated your video!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @video = ArtistVideo.friendly.find(params[:id]).destroy
    redirect_to artist_videos_path(@artist)
  end

  private

  	def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_video_artist
      @video = ArtistVideo.friendly.find(params[:id])
      redirect_to artist_path(@video.artist_id) if @video.artist_id != current_artist.id
    end

    def video_params
      params.require(:artist_video).permit(:title, :description, :video, :slug)
    end

end