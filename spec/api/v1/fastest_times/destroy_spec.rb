require "rails_helper"

RSpec.describe "fastest_times#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/fastest_times/#{fastest_time.id}"
  end

  describe "basic destroy" do
    let!(:fastest_time) { create(:fastest_time) }

    it "updates the resource" do
      expect(FastestTimeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { FastestTime.count }.by(-1)
      expect { fastest_time.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
