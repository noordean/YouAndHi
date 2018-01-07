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

  def group_creator(group_id)
    group = Group.find(group_id)
    if group.created_by == get_current_user
      return group
    end
  end

  def a_group_member?(group_id)
    group_member = GroupMember.where(
      member: get_current_user,
      group_id: group_id
    )
    if group_member.empty?
      return false
    else
      return true
    end
  end

  def message_owner(message_id)
    message = Message.find(message_id)
    if message.posted_by == get_current_user
      return message
    end
  end

  def status_post_owner(status_post_id)
    status_post = StatusPost.find(status_post_id)
    if status_post.posted_by == get_current_user
      return status_post
    end
  end

  def status_comment_owner(status_comment_id)
    status_comment = StatusComment.find(status_comment_id)
    if status_comment.commented_by == get_current_user
      return status_comment
    end
  end
end
