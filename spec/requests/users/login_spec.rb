require "rails_helper"

RSpec.describe V1::UsersController, type: :request do
  let!(:users) { create :user }
  let(:json) { JSON.parse(response.body) }

  describe "POST /users/login" do
    let(:invalid_user) do
      {
        username: "invalid_username",
        password: "invalid_password"
      }
    end
    let(:valid_user) do
      {
        username: "noordeaan",
        password: "ibro123"
      }
    end

    context "when the request is invalid" do
      before { post "/users/login", params: invalid_user }

      it "creates a user" do
        expect(json["message"]).to eq("Incorrect username/password combination")
      end

      it "returns status code 401" do
        expect(response).to have_http_status(401)
      end
    end

    context "when the request is valid" do
      before { post "/users/login", params: valid_user }

      it "creates a user" do
        expect(json["message"]).to eq("Login successful!")
        expect(response.body).to include "token"
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end
end
