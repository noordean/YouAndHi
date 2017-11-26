class UsersController < ApplicationController
  skip_before_action :authorize_user, :get_current_user, only: %i(create signin)
  include Validation

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

  # POST /api/v1/user/signin
  def signin
    unless validate_signin_params(signin_params[:username],
                                  signin_params[:password])
      username = signin_params[:username]
      password = signin_params[:password]
      user = User.find_by(username: username)
      if user && user.authenticate(password)
        token = JsonWebToken.encode(user_id: user.id)
        return json_response(message: "Login successful!", token: token)
      else
        return json_response(
          {
            message: "Incorrect username/password combination"
          }, :unauthorized
        )
      end
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :phone_number)
  end

  def signin_params
    params.permit(:username, :password)
  end
end
