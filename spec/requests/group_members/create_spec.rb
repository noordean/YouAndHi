require "rails_helper"

RSpec.describe V1::GroupMembersController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:group) { create :group, created_by: user.id }
  let(:headers) { set_header(user.id) }

  describe "POST /groups/group_id/add_users" do
    let(:valid_group_member_attributes) do
      {
        member: user.id,
      }
    end
    let(:invalid_group_member_attributes) do
      {
        member: 10,
      }
    end

    context "when the request is valid" do
      before do
        post "/groups/#{group.id}/add_users",
             params: valid_group_member_attributes,
             headers: headers
      end

      it "creates a group_member record" do
        group_members = GroupMember.all
        expect(json["member"]).to eq(group_members[0].member)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the member does not exist" do
      before do
        post "/groups/#{group.id}/add_users",
             params: invalid_group_member_attributes,
             headers: headers
      end

      it "return an error message" do
        expect(json["message"]).to eq("User must exist")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(422)
      end
    end

    context "when the group does not exist" do
      before do
        post "/groups/5/add_users",
             params: invalid_group_member_attributes,
             headers: headers
      end

      it "return an error message" do
        expect(json["message"]).to eq("Couldn't find Group with 'id'=5")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
