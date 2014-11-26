class Solution < ActiveRecord::Base
  validates :problem_id, presence: true
  validates :posse_id, presence: true
  validates :content, presence: true
  belongs_to :posse
  belongs_to :user
  belongs_to :problem
end
