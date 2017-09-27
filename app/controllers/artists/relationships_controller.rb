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

  def destroy
    current_fan.unfollow_artist(Artist.friendly.find(params[:artist_id]))
    @artist = Artist.friendly.find(params[:artist_id])
    flash.now[:notice] = "You unfollowed #{@artist.name}!"
    redirect_to artist_path(@artist)
  end

end