class Posse < ActiveRecord::Base
  validates :name, presence: true

  has_many :solutions

  def add_score(points)
    self.scores += points
    self.save
  end
end
