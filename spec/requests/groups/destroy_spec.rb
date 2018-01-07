require "rails_helper"

RSpec.describe GroupsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create :user }
  let(:group) { create :group, created_by: user.id }
  let(:headers) { set_header(user.id) }

  describe "DELETE /groups/:id" do
    before do
      delete "/api/v1/groups/#{group.id}", headers: headers
    end

    it "updates group" do
      expect(json["message"]).to eq("Group deleted successfully")
    end

    it "returns status code 201" do
      expect(response).to have_http_status(200)
    end
  end
end
