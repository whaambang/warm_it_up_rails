class Api::V1::SolutionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    render json: Solution.all
  end

  def show
    render json: Solution.find(params[:id])
  end

  def create
    unless current_user.posse.current_solution?
      current_user.posse.solutions.create(solution_params)
      current_user.posse.add_points(params[:solution][:points_earned])
    end
 #   posse.add_score(solution.points_earned)
    head :ok
  end

  private

    def solution_params
      params.require(:solution).permit!
    end
end
