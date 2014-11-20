class Api::V1::ProblemsController < ApplicationController
  # respond_to :json

  def index
    # respond_with Problem.all
    render json: Problem.all
  end

  def show
    # respond_with Problem.find(params[:id])
    render json: Problem.find(params[:id])
  end
end
