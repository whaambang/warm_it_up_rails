require 'rails_helper'

RSpec.describe "Api::V1::Posses", :type => :request do
  it "returns all posses" do
    10.times { Posse.create(name: "Posse Name") }
    get "/api/v1/posses.json"
    json = JSON.parse(response.body)
    expect(json['posses'].count).to eq(10)
  end

  it 'returns a specific posse' do
    posse = Posse.create(name: "McCarthy")
    get "/api/v1/posses/#{posse.id}.json"
    json = JSON.parse(response.body)
    expect(json["posse"]["name"]).to eq("McCarthy")
  end
end
