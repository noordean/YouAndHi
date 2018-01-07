require "rails_helper"

RSpec.describe MessagesController, type: :request do
  let(:user) { create :user }
  let(:group) { create :group, created_by: user.id }
  let!(:group_member) do
    create :group_member, member: user.id, group_id: group.id
  end
  let(:headers) { set_header(user.id) }
  let(:json) { JSON.parse(response.body) }

  describe "POST /messages" do
    let(:valid_message_attributes) do
      {
        message_content: "Hello guyz",
        group_id: group.id,
        posted_by: user.id
      }
    end
    let(:invalid_message_attributes) do
      {
        message_content: "Hello guyz",
        group_id: 100,
        posted_by: user.id
      }
    end

    context "when the request is valid" do
      before do
        post "/api/v1/messages",
             params: valid_message_attributes,
             headers: headers
      end

      it "creates a message" do
        expect(json["message_content"]).to eq("Hello guyz")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before do
        post "/api/v1/messages",
             params: invalid_message_attributes,
             headers: headers
      end

      it "returns an error message" do
        expect(json["message"]).to eq("You do not belong to this group")
      end

      it "returns status code 403" do
        expect(response).to have_http_status(403)
      end
    end
  end
end
