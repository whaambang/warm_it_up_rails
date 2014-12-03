class Api::V1::VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    solution = Solution.find(params[:vote][:solution_id])
    vote = solution.votes.find_or_create_by(user_id: current_user.id)
    solution.add_like_points
    current_user.posse.add_points(50)
    render json: vote
  end
end
