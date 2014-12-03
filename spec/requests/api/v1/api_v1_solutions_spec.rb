require 'rails_helper'

RSpec.describe "Api::V1::Solutions", :type => :request do
  it "returns all solutions" do
    posse = Posse.create(name: "Knuth")
    3.times do
      problem = Problem.create(content: "A problem", answer: "12345")
      Solution.create(problem_id: problem.id, posse_id: posse.id,
                      content: "things.sort", points_earned: 0)
    end

    get "/api/v1/solutions.json"
    json = JSON.parse(response.body)
    expect(json['solutions'].count).to eq(3)
  end

  it "returns a specific solution" do
    problem = Problem.create(content: "A problem", answer: "The answer")
    posse = Posse.create(name: "Knuth")
    solution = Solution.create(problem_id: problem.id,
                               posse_id: posse.id,
                               content: "things.sort",
                               points_earned: 0)

    get "/api/v1/solutions/#{solution.id}.json"
    json = JSON.parse(response.body)
    expect(json["solution"]["content"]).to eq("things.sort")
  end

  it 'is able to create solutions' do
    problem = Problem.create(content: "A problem", answer: "The answer")
    posse = Posse.create(name: "Knuth")
    solution = Solution.create(problem_id: problem.id, posse_id: posse.id,
                               content: "things.sort", points_earned: 0)
    user = User.create(name: "allie", posse_id: posse.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }

    post 'api/v1/solutions.json', solution: { posse_id: 1, problem_id: 1, content: "things.sort", points_earned: 0 }
    expect(response.status).to eq(200)
    expect(Solution.count).to eq(1)
  end

  it 'adds a vote to a solution' do
    problem = Problem.create(content: "A problem", answer: "The answer")
    posse = Posse.create(name: "Knuth")
    solution = Solution.create(problem_id: problem.id, posse_id: posse.id,
                               content: "things.sort", points_earned: 0)
    user = User.create(name: "allie")
    user.posse = posse
    user.save
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }

    get "api/v1/solutions/#{solution.id}/like"
    expect(response.status).to eq(200)
    expect(solution.votes.count).to eq(1)
  end
end
