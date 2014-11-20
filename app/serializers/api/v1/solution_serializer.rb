class Api::V1::SolutionSerializer < ActiveModel::Serializer
  embeds :ids, include: true
  root false
  attributes :id, :posse_id, :problem_id, :content, :points_earned
end
