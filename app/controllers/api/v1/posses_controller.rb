class Api::V1::PossesController < ApplicationController
  respond_to :json

  def index
    respond_with Posse.all
  end

  def show
    respond_with Posse.find(params[:id])
  end
end
