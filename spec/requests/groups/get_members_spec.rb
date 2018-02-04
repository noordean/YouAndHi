require "rails_helper"

RSpec.describe V1::GroupsController, type: :request do
  let!(:user) { create :user }
  let!(:group) { create :group, created_by: user.id }
  let!(:group_member) do
    create :group_member, member: user.id, group_id: group.id
  end
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /group/group_id/members" do
    before { get "/groups/#{group.id}/members", headers: headers }

    it "returns members for the specified group" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0][1]).to eq("noordeaan")
      expect(json[0][2]).to eq("rehema@gmail.com")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
