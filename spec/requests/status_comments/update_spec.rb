require "rails_helper"

RSpec.describe V1::StatusCommentsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:status_post) { create :status_post, posted_by: user.id }
  let(:status_comment) do
    create :status_comment,
           status_post_id: status_post.id,
           commented_by: user.id
  end
  let(:headers) { set_header(user.id) }
  let(:valid_comment_update_attributes) do
    {
      comment: "An edited comment"
    }
  end

  describe "PUT /status_comments/:id" do
    before do
      put "/status_comments/#{status_comment.id}",
          params: valid_comment_update_attributes, headers: headers
    end

    it "updates group" do
      expect(json["message"]).to eq("Comment updated successfully")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(200)
    end
  end
end
