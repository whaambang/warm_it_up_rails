class ProblemsWorker
  include Sidekiq::Worker

  def perform(index)
    Problem.create(content: get_problems(index), answer: get_answers(index))
    puts "Problem #{index} created"
  end

  def get_problems(index)
    problem_url = "https://projecteuler.net/problem="
    url = problem_url + "#{index+1}"
    problem_data = Nokogiri::HTML(open(url))
    problem_content = problem_data.at_css('div.problem_content').content
  end

  def get_answers
    answer_url = "https://code.google.com/p/projecteuler-solutions/wiki/ProjectEulerSolutions"
    answer_data = Nokogiri::HTML(open(answer_url))
    answer_content ||= answer_data.search('p')[2].content.split("\n")
    parsed_content = answer_content[0..-2].map {|number| number[4..-1].gsub(/\W+/, '')}
  end
end
