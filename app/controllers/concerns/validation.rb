module Validation
  def validate_signin_params(username, password)
    if username.nil?
      json_response(
        {
          message: "Username must be supplied"
        }, :unprocessable_entity
      )

      true
    elsif password.nil?
      json_response(
        {
          message: "Password must be supplied"
        }, :unprocessable_entity
      )

      true
    end
  end
end
