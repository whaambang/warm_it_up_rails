require 'rails_helper'

describe Problem, :type => :model do
  describe "with valid params" do
    it "is valid" do
      problem = Problem.new(content: "Hardest question ever.",
                            answer: "You'll never guess it.")
      problem.save

      expect(Problem.count).to eq(1)
    end
  end

  describe "with invalid params" do
    it "is invalid without content" do
      missing_answer = Problem.new(content: "Hardest question ever.")
      missing_answer.save

      missing_content = Problem.new(answer: "You'll never guess it.")
      missing_content.save

      expect(Problem.count).to eq(0)
    end

    it "is invalid without an answer" do
    end
  end
end
