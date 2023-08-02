require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /users" do
    it "Should back with correct response" do
      get users_path
      expect(response).to have_http_status(200)
    end

     it "Should render index view" do
      get users_path
      expect(response).to render_template("users/index")
      expect(response.body).to include("users_index")
    end

    it "Should render show view" do
      get "/users/2"
      expect(response).to render_template("users/show")
      expect(response.body).to include("users_view")
    end
  end
end
