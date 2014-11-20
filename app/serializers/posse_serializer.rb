class PosseSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name

  has_many :solutions
end
