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
    Solution.create(solution_params)
    head :ok
  end

  private

    def solution_params
      params.require(:solution).permit(:posse_id,
                                       :problem_id,
                                       :content,
                                       :points_earned)
    end
end
