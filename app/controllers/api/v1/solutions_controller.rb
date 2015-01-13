class Api::V1::SolutionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    render json: Solution.all
  end

  def show
    render json: Solution.find(params[:id])
  end

  # Point behavior may be worth looking into, if we're adding points
  # for every solution that gets created we may as well make that the
  # default upon creation
  def create
    points = params[:solution][:points_earned]
    unless current_user.posse.current_solution?
      solution = current_user.posse.solutions.create(solution_params)
      current_user.posse.add_points(points.to_i)
    end
    render json: solution
  end


  def remove_like
    solution = Solution.find(params[:id])
    vote = solution.votes.find_by(user_id: current_user.id) # only allow one vote per solution per user
    solution.remove_like_points
    current_user.posse.remove_points(50)
    vote.destroy
    render json: vote
  end

  private

    def solution_params
      params.require(:solution).permit(:problem_id, :content, :points_earned)
    end
end
