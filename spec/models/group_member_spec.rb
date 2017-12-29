require "rails_helper"

RSpec.describe GroupMember, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:member) }
    it { is_expected.to validate_presence_of(:group_id) }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group) }
  end
end
