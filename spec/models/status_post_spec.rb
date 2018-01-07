require "rails_helper"

RSpec.describe StatusPost, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:post) }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:status_comments) }
  end
end
