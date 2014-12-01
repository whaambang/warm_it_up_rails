class User < ActiveRecord::Base
  belongs_to :posse

  has_many :votes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.github_name = auth.info.nickname
      user.email       = auth.info.email
      user.image       = auth.info.image
      user.save
    end
  end
end
