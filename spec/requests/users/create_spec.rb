require "rails_helper"

RSpec.describe UsersController, type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /user/signup" do
    let(:valid_attributes) do
      {
        username: "muinat",
        email: "muinat@gmail.com",
        phone_number: "09089786543",
        password: "ibro123"
      }
    end
    let(:invalid_attributes) do
      {
        username: "muinat",
        email: "muinatgmail.com",
        phone_number: "09089786543",
        password: "ibro123"
      }
    end

    context "when the request is valid" do
      before { post "/api/v1/user/signup", params: valid_attributes }

      it "creates a user" do
        expect(json["username"]).to eq("muinat")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/v1/user/signup", params: invalid_attributes }

      it "returns a validation failure message" do
        expect(json["message"]).to eq("Email must be valid")
      end

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
