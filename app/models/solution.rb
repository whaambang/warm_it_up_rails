class Solution < ActiveRecord::Base
  validates :problem_id, presence: true
  validates :posse_id, presence: true
  validates :content, presence: true
  belongs_to :posse
  belongs_to :user
  belongs_to :problem
  has_many :votes
 
  def add_like_points
    self.points_earned += 250
    self.save
    self.posse.add_points(250)
  end

  def remove_like_points
    self.points_earned -= 250
    self.save
    self.posse.remove_points(250)
  end

end
