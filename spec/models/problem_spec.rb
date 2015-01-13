require 'rails_helper'

describe Problem, :type => :model do
  describe "with valid params" do
    it "is valid" do
      problem = Problem.new(content: "Hardest question ever.",
                            answer: "You'll never guess it.")

      expect(problem).to be_valid
    end
  end

  describe "with invalid params" do
    it "is invalid without content" do
      problem = Problem.new(content: "Hardest question ever.")

      expect(problem).not_to be_valid
    end

    it "is invalid without an answer" do
      problem = Problem.new(answer: "You'll never guess it.")

      expect(problem).not_to be_valid
    end
  end
end
