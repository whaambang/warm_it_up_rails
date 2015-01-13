class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :posse_id, :uid
end
