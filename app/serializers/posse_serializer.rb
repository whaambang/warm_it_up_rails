class PosseSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :scores, :image_url
end
