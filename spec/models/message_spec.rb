require "rails_helper"

RSpec.describe Message, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:message_content) }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:user) }
  end
end
