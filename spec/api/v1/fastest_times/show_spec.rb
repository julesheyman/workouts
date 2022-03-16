require 'rails_helper'

RSpec.describe "fastest_times#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/fastest_times/#{fastest_time.id}", params: params
  end

  describe 'basic fetch' do
    let!(:fastest_time) { create(:fastest_time) }

    it 'works' do
      expect(FastestTimeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('fastest_times')
      expect(d.id).to eq(fastest_time.id)
    end
  end
end
