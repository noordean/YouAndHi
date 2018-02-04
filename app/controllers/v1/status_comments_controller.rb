module V1
  class StatusCommentsController < ApplicationController
    # POST /status_posts/:id/add_comment
    def create
      all_comment_params = {
        comment: status_comment_params[:comment],
        commented_by: get_current_user,
        status_post_id: params[:id]
      }
      comment = StatusComment.create!(all_comment_params)
      json_response(comment, :created)
    end

    # PUT "/status_comments/:id"
    def update
      status_comment = status_comment_owner(params[:id])
      if !status_comment
        json_response({
                        message: "This can only be edited by the comment owner"
                      },
                      :forbidden)
      elsif params[:comment].nil?
        json_response({
                        message: "You need to supply the comment"
                      }, :bad_request)
      else
        status_comment.update(comment: params[:comment])
        json_response(message: "Comment updated successfully")
      end
    end

    # DELETE "/status_comments/:id"
    def destroy
      status_comment = status_comment_owner(params[:id])
      if !status_comment
        json_response({
                        message: "This can only be deleted by the comment owner"
                      }, :forbidden)
      elsif StatusComment.destroy(params[:id])
        json_response(message: "Comment deleted successfully")
      else
        json_response({
                        message: "Unable to delete post"
                      }, :internal_server_error)
      end
    end

    private

    def status_comment_params
      params.permit(:comment, :commented_by, :status_post_id)
    end
  end
end
