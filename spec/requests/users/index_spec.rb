require "rails_helper"

RSpec.describe UsersController, type: :request do
  let!(:users) { create :user }
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(1) }

  describe "GET /users" do
    before { get "/api/v1/users", headers: headers }

    it "returns users" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["username"]).to eq("noordeaan")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
