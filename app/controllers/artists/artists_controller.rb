class Artists::ArtistsController < ApplicationController

  def show
    @artist = Artist.friendly.find(params[:id])
    @post = ArtistPost.new
    @relationship = ArtistRelationship.new
    if fan_signed_in? && current_fan.following_artist?(@artist)
      @settings = ArtistRelationship.find(current_fan.artist_relationship_id(@artist))
    end
    @photo_album = ArtistPhotoAlbum.new
    @photo = ArtistPhoto.new
    @video = ArtistVideo.new
    @tour = ArtistTour.new
    @show = ArtistShow.new
    @item = ArtistItem.new
    @album = ArtistAlbum.new
    @track = ArtistTrack.new
  end
  
end