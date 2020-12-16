require 'rails_helper'

RSpec.describe "MissionPhotos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/mission_photos/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/mission_photos/show"
      expect(response).to have_http_status(:success)
    end
  end

end
