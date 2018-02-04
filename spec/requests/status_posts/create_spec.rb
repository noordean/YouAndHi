require "rails_helper"

RSpec.describe V1::StatusPostsController, type: :request do
  let(:user) { create :user }
  let(:headers) { set_header(user.id) }
  let(:json) { JSON.parse(response.body) }

  describe "POST /messages" do
    let(:valid_status_post_attributes) do
      {
        post: "My status",
      }
    end
    before do
      post "/status_posts",
           params: valid_status_post_attributes,
           headers: headers
    end

    it "creates a message" do
      expect(json["post"]).to eq("My status")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(201)
    end
  end
end
