require 'rails_helper'

RSpec.describe Sport, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:fastest_times) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
