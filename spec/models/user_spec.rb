require "rails_helper"

RSpec.describe User, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  end

  context "when validating associations" do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:groups) }
    it { is_expected.to have_many(:group_members) }
  end
end
