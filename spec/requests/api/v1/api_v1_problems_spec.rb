require 'rails_helper'

RSpec.describe "Api::V1::Problems", :type => :request do
  it "returns all problems" do
    10.times { Problem.create(content: "If a tree falls in the woods and no one is there to hear it, does it make a sound?", answer: "Nope.") }

    get "/api/v1/problems.json"
    json = JSON.parse(response.body)
    expect(json['problems'].count).to eq(10)
  end

  it 'returns a specific problem' do
    problem         = Problem.new
    problem.content = "If a tree falls in the woods and no one is there to hear it, does it make a sound?"
    problem.answer  = "Nope."
    problem.save

    get "/api/v1/problems/#{problem.id}.json"
    json = JSON.parse(response.body)
    expect(json["problem"]["answer"]).to eq("Nope.")
  end
end
