class SolutionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :problem_id, :posse_id, :content, :points_earned, :created_at

  has_many :votes

  private

    def attributes
      hash = super
      if object.posse
        hash.merge!(:posse => object.posse.name, :posse_image => object.posse.image_url)
      end
      hash
    end
#  has_one :posse
#  has_one :problem
end
