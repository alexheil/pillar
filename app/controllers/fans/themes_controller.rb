class Fans::ThemesController < ApplicationController

  before_action :authenticate_fan!
  #before_action :correct_fan
  before_action :set_fan

  def edit
    @theme = @fan.fan_theme
  end

  def update
    @theme = @fan.fan_theme
    if @theme.update_attributes(theme_params)
      flash[:notice] = "You've successfully updated your theme!"
      redirect_to current_fan
    else
      render 'edit'
      flash[:alert] = "You failed to update your theme."
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

    def theme_params
      params.require(:fan_theme).permit(:main_color, :text_color, :background_color, :link_color)
    end

end