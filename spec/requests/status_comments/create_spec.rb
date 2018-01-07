require "rails_helper"

RSpec.describe StatusCommentsController, type: :request do
  let(:user) { create :user }
  let(:status_post) { create :status_post, posted_by: user.id }
  let(:headers) { set_header(user.id) }
  let(:json) { JSON.parse(response.body) }

  describe "POST /messages" do
    let(:valid_status_comment_attributes) do
      {
        comment: "My comment",
        commented_by: user.id,
        status_post_id: status_post.id
      }
    end
    before do
      post "/api/v1/status_posts/#{status_post.id}/add_comment",
           params: valid_status_comment_attributes,
           headers: headers
    end

    it "creates a message" do
      expect(json["comment"]).to eq("My comment")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(201)
    end
  end
end
