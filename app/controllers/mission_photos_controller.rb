class MissionPhotosController < ApplicationController

  def index
    redirect_to mission_path(params[:mission_id])
  end

  def show
    @photo = MissionPhoto.find(params[:id])
  end
end
