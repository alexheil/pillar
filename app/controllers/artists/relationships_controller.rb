class Artists::RelationshipsController < ApplicationController

  before_action :authenticate_fan!


  def create
    @relationship = ArtistRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.artist_id = Artist.friendly.find(params[:artist_id]).id
    @artist = Artist.friendly.find(params[:artist_id])
    if @relationship.save
      flash.now[:notice] = "You followed #{@artist.name}!"
      redirect_to artist_path(@artist)
    else
      redirect_to root_url
    end
  end

  def update
    @artist = Artist.friendly.find(params[:artist_id])
    @settings = ArtistRelationship.find(params[:id])
    if @settings.update_attributes(relationship_params)
      flash[:notice] = "You've successfully updated your email notifications for this artist!"
      redirect_to artist_path(@artist)
    else
      render 'edit'
      flash[:alert] = "You failed to update your email notifications for this artist."
    end
  end

  def destroy
    current_fan.unfollow_artist(Artist.friendly.find(params[:artist_id]))
    @artist = Artist.friendly.find(params[:artist_id])
    flash.now[:notice] = "You unfollowed #{@artist.name}!"
    redirect_to artist_path(@artist)
  end

    private

      def relationship_params
        params.require(:artist_relationship).permit(:post_email, :photo_email, :video_email, :merch_email, :tour_email, :show_email, :album_email)
      end

end