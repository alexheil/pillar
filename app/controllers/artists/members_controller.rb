class Artists::MembersController < ApplicationController

	before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

   def create
    @member = @artist.artist_members.build(member_params)
    if @member.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully added a member!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

	def update
		@member = ArtistMember.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:notice] = "You've successfully updated your members!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "You failed to update your members."
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

		def member_params
			params.require(:artist_member).permit(:instrument, :name, :past)
		end

end