class StatusCommentsController < ApplicationController
  # POST /api/v1/status_posts/:id/add_comment
  def create
    all_comment_params = {
      comment: status_comment_params[:comment],
      commented_by: get_current_user,
      status_post_id: params[:id]
    }
    comment = StatusComment.create!(all_comment_params)
    json_response(comment, :created)
  end

  private

  def status_comment_params
    params.permit(:comment, :commented_by, :status_post_id)
  end
end
