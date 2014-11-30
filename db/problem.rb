require 'nokogiri'
require 'open-uri'

class Problem
  def self.content
    @base_url = "https://projecteuler.net/problem="
    3.times do |n|
      url = @base_url + "#{n+1}"
      data = Nokogiri::HTML(open(url))
      content = data.at_css('div.problem_content').content
    end
  end


  def self.generate
    Problem.create(content: content, answer: answer)
  end
end

Problem.generate
