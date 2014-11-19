require 'rails_helper'

describe 'the solution' do
  it 'is valid with a problem_id, posse_id, content, and points_earned' do

  solution = Solution.create(problem_id: 1,
                              posse_id: 1,
                              content: "things.sort",
                              points_earned: 0
                              )
    expect(Solution.all.count).to eq(1)
  end

  it 'is invalid without problem_id, posse_id, or content' do
    missing_problem_id    = Solution.create(posse_id: 1, content: "things.sort", points_earned: 0)
    missing_posse_id      = Solution.create(problem_id: 1, content: "things.sort", points_earned: 0)
    missing_content       = Solution.create(problem_id: 1, posse_id: 1, points_earned: 0)

    expect(Solution.all.count).to eq(0)
  end

  it 'has a score of 0 by default' do
    missing_points_earned = Solution.create(problem_id: 1, posse_id: 1, content: "things.sort")

    expect(Solution.all.count).to eq(1)
    expect(Solution.first.points_earned).to eq(0)
  end

end