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

  def the_group_creator?(group_id)
    group = Group.find(group_id)
    if group.created_by == get_current_user
      return true
    end
  end
end
