require "rails_helper"

RSpec.describe "sports#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sports", params: params
  end

  describe "basic fetch" do
    let!(:sport1) { create(:sport) }
    let!(:sport2) { create(:sport) }

    it "works" do
      expect(SportResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["sports"])
      expect(d.map(&:id)).to match_array([sport1.id, sport2.id])
    end
  end
end
