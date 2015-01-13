require 'rails_helper'

describe Solution, type: :model do

  it { should have_many(:votes)   }
  it { should belong_to(:posse)   }
  it { should belong_to(:problem) }

  it { should validate_presence_of(:problem_id) }
  it { should validate_presence_of(:posse_id)   }
  it { should validate_presence_of(:content)    }

  it "has a score of 0 by default" do
    solution = Solution.create(problem_id: 1, posse_id: 1, content: "things.sort")

    expect(solution.points_earned).to eq(0)
  end
end

