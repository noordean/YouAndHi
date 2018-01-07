class StatusPostsController < ApplicationController
  # POST /api/v1/status_posts
  def create
    all_post_params = {
      post: status_post_params[:post],
      posted_by: get_current_user
    }
    post = StatusPost.create!(all_post_params)
    json_response(post, :created)
  end

  private

  def status_post_params
    params.permit(:post, :posted_by)
  end
end
