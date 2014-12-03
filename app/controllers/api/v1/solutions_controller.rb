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

  def like
    solution = Solution.find(params[:id])
    solution.votes.find_or_create_by(user_id: current_user.id) # only allow one vote per solution per user
    render json: solution
  end

  def remove_like
    solution = Solution.find(params[:id])
    vote = solution.votes.find_by(user_id: current_user.id) # only allow one vote per solution per user
    vote.destroy
    render json: solution
  end

  private

    def solution_params
      params.require(:solution).permit!
    end
end
