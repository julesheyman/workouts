require "rails_helper"

RSpec.describe "fastest_times#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/fastest_times", params: params
  end

  describe "basic fetch" do
    let!(:fastest_time1) { create(:fastest_time) }
    let!(:fastest_time2) { create(:fastest_time) }

    it "works" do
      expect(FastestTimeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["fastest_times"])
      expect(d.map(&:id)).to match_array([fastest_time1.id, fastest_time2.id])
    end
  end
end
