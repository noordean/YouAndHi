require "rails_helper"

RSpec.describe V1::StatusPostsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:status_post) { create :status_post, posted_by: user.id }
  let(:headers) { set_header(user.id) }
  let(:valid_post_update_attributes) do
    {
      post: "An edited post"
    }
  end

  describe "PUT /status_posts/:id" do
    before do
      put "/status_posts/#{status_post.id}",
          params: valid_post_update_attributes, headers: headers
    end

    it "updates group" do
      expect(json["message"]).to eq("Post updated successfully")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(200)
    end
  end
end
