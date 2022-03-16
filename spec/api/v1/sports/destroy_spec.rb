require 'rails_helper'

RSpec.describe "sports#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sports/#{sport.id}"
  end

  describe 'basic destroy' do
    let!(:sport) { create(:sport) }

    it 'updates the resource' do
      expect(SportResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Sport.count }.by(-1)
      expect { sport.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
