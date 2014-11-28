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

Problem.create(content: "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

               Find the sum of all the multiples of 3 or 5 below 1000.",
               answer: "233138")
