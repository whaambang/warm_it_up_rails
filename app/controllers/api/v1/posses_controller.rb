class Api::V1::PossesController < ApplicationController
  respond_to :json

  def index
    respond_with Posse.all
  end

  def show
    posse = Posse.find(params[:id])
    respond_with posse
  end
end
