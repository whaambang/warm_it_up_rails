Solution.create!([
  {posse_id: 1, problem_id: 1, content: "Best answer ever.", points_earned: 105},
  {posse_id: 2, problem_id: 1, content: "ok answer.", points_earned: 15},
  {posse_id: 3, problem_id: 1, content: "some answer.", points_earned: 5},
  {posse_id: 4, problem_id: 1, content: "42", points_earned: 1005},
])

Posse.create!([
  { name: "Knuth" },
  { name: "Brooks" },
  { name: "Von Neumann" },
  { name: "Matsumoto" }
])

def content(index)
  @base_url ||= "https://projecteuler.net/problem="
  url = @base_url + "#{index+1}"
  data = Nokogiri::HTML(open(url))
  content = data.at_css('div.problem_content').content
end


def answer(index)
  @url ||= "https://code.google.com/p/projecteuler-solutions/wiki/ProjectEulerSolutions"
  @data ||= Nokogiri::HTML(open(@url))
  @content ||= @data.search('p')[2].content.split("\n")
  parsed_content = @content[0..-2].map {|number| number[4..-1].gsub(/\W+/, '')}
  parsed_content[index]
end

476.times do |index|
  Problem.create(content: content(index), answer: answer(index))
  puts "Problem #{index} created"
end
