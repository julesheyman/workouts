require 'rails_helper'

RSpec.describe "fastest_times#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/fastest_times", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'fastest_times',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FastestTimeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { FastestTime.count }.by(1)
    end
  end
end
