require "rails_helper"

RSpec.describe Group, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:group_name) }
    it { is_expected.to validate_presence_of(:group_description) }
    it { is_expected.to validate_uniqueness_of(:group_name).case_insensitive }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:group_members) }
  end
end
