require "rails_helper"

RSpec.describe FastestTime, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:sport) }

    it { should belong_to(:workout) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
