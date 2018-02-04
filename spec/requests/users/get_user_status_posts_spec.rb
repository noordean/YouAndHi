require "rails_helper"

RSpec.describe V1::UsersController, type: :request do
  let!(:user) { create :user }
  let!(:status_post) { create :status_post, posted_by: user.id }
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /users/:id/status_posts" do
    before { get "/users/#{user.id}/status_posts", headers: headers }

    it "returns status posts made by the user" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["post"]).to eq("My post")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
