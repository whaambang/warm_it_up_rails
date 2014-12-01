require 'rails_helper'

RSpec.describe "Github Omniauth", :type => :request do
  describe "GET /auth/github/callback" do

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        "provider" => "github",
        "uid" => "12345",
        "info" => { "name" => "github user" }
      })
    end

    it "successfully logs in with github oauth" do
      get "auth/github/callback"
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
      expect(response.status).to eq(200)
      expect(User.count).to eq(1)
    end
  end
end
