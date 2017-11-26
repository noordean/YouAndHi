require "rails_helper"

RSpec.describe GroupsController, type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /group" do
    let(:valid_group_attributes) do
      {
        group_name: "group test",
        group_description: "for testing group"
      }
    end
    let(:invalid_group_attributes) do
      {
        group_name: "123456",
        group_description: "for testing group"
      }
    end
    let(:headers) do
      {
        "token" => JsonWebToken.encode(user_id: 1)
      }
    end

    context "when the request is valid" do
      before do
        post "/api/v1/group",
             params: valid_group_attributes, headers: headers
      end

      it "creates a user" do
        expect(json["group_name"]).to eq("group test")
        expect(json["group_description"]).to eq("for testing group")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before do
        post "/api/v1/group",
             params: invalid_group_attributes,
             headers: headers
      end

      it "returns a validation failure message" do
        expect(json["message"]).to eq(
          "Group name can contain only letters and space and be of at least two characters"
        )
      end

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end

    context "when token is not supplied" do
      before { post "/api/v1/group", params: invalid_group_attributes }

      it "returns a validation failure message" do
        expect(json["message"]).to eq(
          "Access denied!. Kindly supply your token."
        )
      end

      it "returns status code 422" do
        expect(response).to have_http_status(401)
      end
    end
  end
end
