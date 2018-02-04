require "rails_helper"

RSpec.describe V1::UsersController, type: :request do
  let!(:user) { create :user }
  let!(:group) { create :group, created_by: user.id }
  let!(:group_member) do
    create :group_member, member: user.id, group_id: group.id
  end
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /users/groups" do
    before { get "/users/groups", headers: headers }

    it "returns groups a logged-in user belongs" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["group_name"]).to eq("test group")
      expect(json[0]["group_description"]).to eq("for testing")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
