class Api::V1::SolutionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index
    respond_with Solution.all
  end

  def show
    respond_with Solution.find(params[:id])
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
