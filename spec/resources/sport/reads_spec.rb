require "rails_helper"

RSpec.describe SportResource, type: :resource do
  describe "serialization" do
    let!(:sport) { create(:sport) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sport.id)
      expect(data.jsonapi_type).to eq("sports")
    end
  end

  describe "filtering" do
    let!(:sport1) { create(:sport) }
    let!(:sport2) { create(:sport) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: sport2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([sport2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:sport1) { create(:sport) }
      let!(:sport2) { create(:sport) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sport1.id,
                                      sport2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sport2.id,
                                      sport1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
