class Api::V1::VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    solution = Solution.find(params[:vote][:solution_id])
    vote = solution.votes.find_or_initialize_by(user_id: current_user.id)
    if vote.new_record?
      vote.save
      solution.add_like_points 
      current_user.posse.add_points(50) 
      render json: vote
    else
      render json: vote, :status => :unprocessable_entity
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.solution.remove_like_points
    vote.solution.posse.remove_points(50)
    vote.destroy
    head :ok
  end
end
