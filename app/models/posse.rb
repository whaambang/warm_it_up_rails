class Posse < ActiveRecord::Base
  validates :name, presence: true
end

