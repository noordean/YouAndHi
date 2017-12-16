require "rails_helper"

RSpec.describe Group, type: :model do
  it { is_expected.to validate_presence_of(:group_name) }
  it { is_expected.to validate_presence_of(:group_description) }
  it { is_expected.to validate_uniqueness_of(:group_name).case_insensitive }
end
