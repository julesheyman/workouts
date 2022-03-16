require "rails_helper"

RSpec.describe FastestTimeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "fastest_times",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FastestTimeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { FastestTime.count }.by(1)
    end
  end

  describe "updating" do
    let!(:fastest_time) { create(:fastest_time) }

    let(:payload) do
      {
        data: {
          id: fastest_time.id.to_s,
          type: "fastest_times",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FastestTimeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { fastest_time.reload.updated_at }
      # .and change { fastest_time.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:fastest_time) { create(:fastest_time) }

    let(:instance) do
      FastestTimeResource.find(id: fastest_time.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { FastestTime.count }.by(-1)
    end
  end
end
