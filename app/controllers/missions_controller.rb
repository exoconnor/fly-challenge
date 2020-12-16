class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.includes(:photos)
                      .find(params[:id])
  end
end
