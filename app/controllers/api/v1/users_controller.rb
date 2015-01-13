class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    User.create(user_params)
  end

  def current
    pp current_user
    pp session[:user_id]
    # respond_with current_user
    render json: current_user
  end

private

  def user_params
    params.require(:user).permit(:name, :uid, :provider, :github_name,
                                 :email, :posse_id, :image)
  end
end
