module V1
  class StatusPostsController < ApplicationController
    # POST /status_posts
    def create
      all_post_params = {
        post: status_post_params[:post],
        posted_by: get_current_user
      }
      post = StatusPost.create!(all_post_params)
      json_response(post, :created)
    end

    # PUT "/status_posts/:id"
    def update
      status_post = status_post_owner(params[:id])
      if !status_post
        json_response({
                        message: "This can only be edited by the post owner"
                      },
                      :forbidden)
      elsif params[:post].nil?
        json_response({
                        message: "You need to supply the post"
                      }, :bad_request)
      else
        status_post.update(post: params[:post])
        json_response(message: "Post updated successfully")
      end
    end

    # DELETE "/status_posts/:id"
    def destroy
      status_post = status_post_owner(params[:id])
      if !status_post
        json_response({
                        message: "This can only be deleted by the post owner"
                      }, :forbidden)
      elsif StatusPost.destroy(params[:id])
        json_response(message: "Post deleted successfully")
      else
        json_response({
                        message: "Unable to delete post"
                      }, :internal_server_error)
      end
    end

    # GET /status_posts/:id/status_comments
    def get_status_post_comments
      status_comments = StatusPost.find(params[:id]).status_comments
      json_response(status_comments)
    end

    private

    def status_post_params
      params.permit(:post, :posted_by)
    end
  end
end
