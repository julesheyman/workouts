require "rails_helper"

RSpec.describe "sports#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sports/#{sport.id}", payload
  end

  describe "basic update" do
    let!(:sport) { create(:sport) }

    let(:payload) do
      {
        data: {
          id: sport.id.to_s,
          type: "sports",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SportResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { sport.reload.attributes }
    end
  end
end
