require "rails_helper"

describe "API" do

  #posse tests
  it "returns all posses" do
    10.times { Posse.create(name: "Posse Name") }
    get "/api/v1/posses.json"
    json = JSON.parse(response.body)
    expect(json['posses'].count).to eq(10)
  end

  it 'returns a specific posse' do
    posse      = Posse.new
    posse.name = "McCarthy"
    posse.save

    get "/api/v1/posses/#{posse.id}.json"
    json = JSON.parse(response.body)
    expect(json["posse"]["name"]).to eq("McCarthy")
  end

  #problem tests
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

  #solution tests
  it "returns all solutions" do
    posse = Posse.create(name: "Knuth")
    10.times do
      problem = Problem.create(content: "A problem", answer: "12345")
      Solution.create(problem_id: problem.id,
                      posse_id: posse.id,
                      content: "things.sort",
                      points_earned: 0)
    end

    get "/api/v1/solutions.json"
    json = JSON.parse(response.body)
    expect(json['solutions'].count).to eq(10)
  end

  it "returns a specific solution" do
    solution = Solution.create(problem_id: 1,
                               posse_id: 1,
                               content: "things.sort",
                               points_earned: 0)

    get "/api/v1/solutions/#{solution.id}.json"
    json = JSON.parse(response.body)
    expect(json["solution"]["content"]).to eq("things.sort")
  end

  it 'is able to create solutions' do
    post 'api/v1/solutions.json', solution: { posse_id: 1, problem_id: 1, content: "things.sort", points_earned: 0 }
    expect(response.status).to eq(200)
  end

  #evalulate code test
  it "returns evaluated code" do
    get "/api/v1/coderunner", { code: "puts 'hello world'" }
    resp = response.body.delete('"')
    expect(resp).to eq("hello world")
  end
end
