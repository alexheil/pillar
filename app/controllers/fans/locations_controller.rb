class Fans::LocationsController < ApplicationController

  before_action :authenticate_fan!
  before_action :correct_fan
  before_action :set_fan

  def edit
    @location = @fan.fan_location
  end

  def update
    @location = @fan.fan_location
    if @location.update_attributes(location_params)
      flash[:notice] = "You've successfully updated your location!"
      redirect_to current_fan
    else
      render 'edit'
      flash[:alert] = "You failed to update your location."
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

    def location_params
      params.require(:fan_location).permit(:city, :state, :country)
    end

end