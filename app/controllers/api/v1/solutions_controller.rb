class Api::V1::SolutionsController < ApplicationController
  respond_to :json

  def index
    respond_with Solution.all
  end

  def show
    respond_with Solution.find(params[:id])
  end
end
