require "rails_helper"

RSpec.describe SportResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "sports",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SportResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Sport.count }.by(1)
    end
  end

  describe "updating" do
    let!(:sport) { create(:sport) }

    let(:payload) do
      {
        data: {
          id: sport.id.to_s,
          type: "sports",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SportResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { sport.reload.updated_at }
      # .and change { sport.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:sport) { create(:sport) }

    let(:instance) do
      SportResource.find(id: sport.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Sport.count }.by(-1)
    end
  end
end
