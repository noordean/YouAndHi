require "rails_helper"

RSpec.describe StatusCommentsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:status_post) { create :status_post, posted_by: user.id }
  let(:status_comment) do
    create :status_comment,
           commented_by: user.id,
           status_post_id: status_post.id
  end
  let(:headers) { set_header(user.id) }

  describe "DELETE /status_comments/:id" do
    before do
      delete "/api/v1/status_comments/#{status_comment.id}", headers: headers
    end

    it "deletes comment" do
      expect(json["message"]).to eq("Comment deleted successfully")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
