require "rails_helper"

RSpec.describe "fastest_times#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/fastest_times/#{fastest_time.id}", payload
  end

  describe "basic update" do
    let!(:fastest_time) { create(:fastest_time) }

    let(:payload) do
      {
        data: {
          id: fastest_time.id.to_s,
          type: "fastest_times",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FastestTimeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { fastest_time.reload.attributes }
    end
  end
end
