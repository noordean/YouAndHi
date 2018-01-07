require "rails_helper"

RSpec.describe MessagesController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:group) { create :group, created_by: user.id }
  let(:message) { create :message, group_id: group.id, posted_by: user.id }
  let(:headers) { set_header(user.id) }
  let(:valid_message_update_attributes) do
    {
      message_content: "Hello guyz!",
      id: message.id
    }
  end

  describe "PUT /messages/:id" do
    before do
      put "/api/v1/messages/#{message.id}",
          params: valid_message_update_attributes, headers: headers
    end

    it "updates group" do
      expect(json["message"]).to eq("Message updated successfully")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(200)
    end
  end
end
