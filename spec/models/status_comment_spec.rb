require "rails_helper"

RSpec.describe StatusComment, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:comment) }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:status_post) }
  end
end
