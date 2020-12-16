class MissionPhotosController < ApplicationController

  def index
    logger.error params
    redirect_to mission_path(params[:mission_id])
  end

  def show
    logger.error "HERE"
    logger.error params
    @photo = MissionPhoto.find(params[:id])
  end
end
