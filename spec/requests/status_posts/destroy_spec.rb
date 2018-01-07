require "rails_helper"

RSpec.describe StatusPostsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:status_post) { create :status_post, posted_by: user.id }
  let(:headers) { set_header(user.id) }

  describe "DELETE /status_posts/:id" do
    before do
      delete "/api/v1/status_posts/#{status_post.id}", headers: headers
    end

    it "deletes group" do
      expect(json["message"]).to eq("Post deleted successfully")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
