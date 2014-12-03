class Posse < ActiveRecord::Base
  validates :name, presence: true

  has_many :solutions


  def add_points(points)
    self.scores += points
    self.save
  end

  def remove_points(points)
    self.scores -= points
    self.save
  end

  def current_solution?
    solutions.any? do |solution|
      solution.created_at.to_date == Date.current
    end
  end
end
