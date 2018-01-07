require "rails_helper"

RSpec.describe GroupsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:group) { create :group, created_by: user.id }
  let(:headers) { set_header(user.id) }
  let(:valid_group_update_attributes) do
    {
      group_name: "group test",
      id: group.id
    }
  end

  describe "PUT /groups/:id" do
    before do
      put "/api/v1/groups/#{group.id}",
          params: valid_group_update_attributes, headers: headers
    end

    it "updates group" do
      expect(json["message"]).to eq("Group updated successfully")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(200)
    end
  end
end
