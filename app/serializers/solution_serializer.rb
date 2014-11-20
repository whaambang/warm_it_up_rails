class SolutionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  root false
  attributes :id, :problem_id, :content, :points_earned
end
