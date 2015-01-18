class Api::V1::SolutionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    respond_with Solution.all
  end

  def show
    respond_with Solution.find(params[:id])
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

  private

    def solution_params
      params.require(:solution).permit(:problem_id, :content, :points_earned)
    end
end
