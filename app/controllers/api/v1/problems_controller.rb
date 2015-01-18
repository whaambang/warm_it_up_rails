class Api::V1::ProblemsController < ApplicationController
  respond_to :json

  def index
    respond_with Problem.all
  end

  def show
    problem = Problem.find(params[:id])
    respond_with problem
  end
end
