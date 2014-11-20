class SolutionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :problem_id, :posse_id, :content, :points_earned

  has_one :problem
end
