class ProblemSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :content, :answer
end
