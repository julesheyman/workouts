require 'rails_helper'

RSpec.describe FastestTimeResource, type: :resource do
  describe 'serialization' do
    let!(:fastest_time) { create(:fastest_time) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(fastest_time.id)
      expect(data.jsonapi_type).to eq('fastest_times')
    end
  end

  describe 'filtering' do
    let!(:fastest_time1) { create(:fastest_time) }
    let!(:fastest_time2) { create(:fastest_time) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: fastest_time2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([fastest_time2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:fastest_time1) { create(:fastest_time) }
      let!(:fastest_time2) { create(:fastest_time) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            fastest_time1.id,
            fastest_time2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            fastest_time2.id,
            fastest_time1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
