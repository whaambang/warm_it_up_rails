class ProblemSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :content, :answer
  has_many :solutions
end
