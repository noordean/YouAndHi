class UsersController < ApplicationController

  # GET /api/v1/users
  def index
    @users = User.all.select(:id, :username, :email, :phone_number)
    json_response(@users)
  end

 # POST /api/v1/user/signup
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private

  def user_params
    params.permit(:username, :email, :password, :phone_number)
  end
end
