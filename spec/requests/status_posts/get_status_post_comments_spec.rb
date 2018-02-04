require "rails_helper"

RSpec.describe V1::StatusPostsController, type: :request do
  let!(:user) { create :user }
  let!(:status_post) { create :status_post, posted_by: user.id }
  let!(:status_comment) do
    create :status_comment,
           commented_by: user.id,
           status_post_id: status_post.id
  end
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /api/v1/status_posts/:id/status_comments" do
    before do
      get "/status_posts/#{status_post.id}/status_comments",
          headers: headers
    end

    it "returns status comments made on the post" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["comment"]).to eq("My comment")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
