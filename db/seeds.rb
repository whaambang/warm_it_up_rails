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
