class Api::V1::PossesController < ApplicationController
  respond_to :json

  def index
    render json: Posse.all
    # respond_with Posse.all
  end

  def show
    render json: Posse.find(params[:id])
    # respond_with Posse.find(params[:id])
  end
end
