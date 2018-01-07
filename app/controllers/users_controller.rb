class UsersController < ApplicationController
  skip_before_action :authorize_user, :get_current_user, only: %i(create login)

  # GET /api/v1/users
  def index
    @users = User.all.select(:id, :username, :email, :phone_number)
    json_response(@users)
  end

  # POST /api/v1/users/new
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # POST /api/v1/users/login
  def login
    unless validate_signin_params(login_params[:username],
                                  login_params[:password])
      username = login_params[:username]
      password = login_params[:password]
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

  # GET /api/v1/users/groups
  def get_user_groups
    group_members = User.find(get_current_user).group_members.includes(:group)
    group_details = []
    group_members.each do |group_member|
      group_details << group_member.group
    end
    json_response(group_details)
  end

  # GET /api/v1/users/:id/status_posts
  def get_user_status_posts
    status_posts = User.find(params[:id]).status_posts
    json_response(status_posts)
  end

  private

  def user_params
    params.permit(:username, :email, :password, :phone_number)
  end

  def login_params
    params.permit(:username, :password)
  end
end
