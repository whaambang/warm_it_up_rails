class Api::V1::UsersController < ApplicationController
  respond_to :json
  
  def create
    User.create(user_params)
  end

private

  def user_params
    params.require(:user).permit(:name,
                                 :uid,
                                 :provider,
                                 :github_name,
                                 :email,
                                 :posse_id,
                                 :image)
  end

end