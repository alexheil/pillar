class Artists::ArtistsController < ApplicationController

  def show
    @artist = Artist.friendly.find(params[:id])
    @post = ArtistPost.new
    @relationship = ArtistRelationship.new
  end
  
end