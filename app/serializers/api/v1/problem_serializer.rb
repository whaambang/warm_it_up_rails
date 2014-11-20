class Api::V1::ProblemSerializer < ActiveModel::Serializer
  embeds :ids, include: true
  attributes :id, :content, :answer
end
