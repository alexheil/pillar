class Fans::ProfilesController < ApplicationController

  before_action :authenticate_fan!
  before_action :correct_fan
  before_action :set_fan

  def edit
    @profile = @fan.fan_profile
    @theme = @fan.fan_theme
    @location = @fan.fan_location
  end

  def update
    @profile = @fan.fan_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "You've successfully updated your profile!"
      redirect_to current_fan
    else
      render 'edit'
      flash[:alert] = "You failed to update your profile."
    end
  end

  private

    def set_fan
      @fan = current_fan
    end

    def correct_fan
      @fan = Fan.friendly.find(params[:fan_id])
      if current_fan != @fan
        redirect_to fan_path(@fan)
        flash[:alert] = "This is not your profile."
      end
    end

    def profile_params
      params.require(:fan_profile).permit(:biography, :website_url, :facebook_handle, :facebook_url, :twitter_handle, :twitter_url, :instagram_handle, :instagram_url, :youtube_handle, :youtube_url, :letlyrics_url)
    end

end