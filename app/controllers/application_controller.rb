class ApplicationController < ActionController::API
  before_action :authorize_user, :get_current_user
  include Response
  include ExceptionHandler

  def authorize_user
    unless request.headers[:HTTP_TOKEN].present?
      json_response({
                      message: "Access denied!. Kindly supply your token."
                    }, :unauthorized)
    end
  end

  def get_current_user
    token = request.headers[:HTTP_TOKEN]

    JsonWebToken.decode(token)[:user_id]
  end
end
