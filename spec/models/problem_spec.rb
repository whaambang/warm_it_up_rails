require 'rails_helper'

describe 'the problem' do

  it 'is valid with content and an answer' do
    problem = Problem.new(content: "Hardest question ever.",
                          answer: "You'll never guess it.")
    problem.save

    expect(Problem.count).to eq(1)
  end

  it 'is invalid without either content or an answer' do
    missing_answer = Problem.new(content: "Hardest question ever.")
    missing_answer.save

    missing_content = Problem.new(answer: "You'll never guess it.")
    missing_content.save

    expect(Problem.count).to eq(0)
  end
end
