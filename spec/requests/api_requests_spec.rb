require 'rails_helper'

describe 'API' do

  it 'returns all posses' do
    10.times {Posse.create(name: "Posse Name")}
    get "/api/v1/posses.json"
    json = JSON.parse(response.body)

    expect(json['posses'].count).to eq(10)
  end

  it 'returns a specific posse' do
    posse = Posse.new
    posse.name = "McCarthy"
    posse.save

    get "/api/v1/posses/#{posse.id}.json"

    json = JSON.parse(response.body)
    expect(json["name"]).to eq("McCarthy")
  end

end