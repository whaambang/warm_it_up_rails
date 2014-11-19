class Posse < ActiveRecord::Base
  validates :name, presence: true

  has_many :solutions
end