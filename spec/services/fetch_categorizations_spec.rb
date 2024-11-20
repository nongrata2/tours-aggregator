# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe FetchCategorizations do
  describe '.call' do
    let!(:city) { create(:city, name: 'Gibraltar', sputnik_id: 1244) }
    let!(:tour) { create(:tour, sputnik_id: 15, title: 'Test Title', city: city) }
    let!(:tag) { create(:tag, id: 1554, slug: 'transfer') }

    let(:fake_tags_data) do
      {
        'data' => [
          {
            'id' => 1554,
            'slug' => 'transfer',
            'activities_count' => 12
          }
        ]
      }
    end

    let(:fake_tours_data) do
      {
        'data' => [
          {
            'title' => 'Test Title',
            'city_id' => 1244,
            'id' => 15
          }
        ]
      }
    end

    before do
      mock_client = instance_double('SputnikApi::Client')
      allow(SputnikApi::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:categories).with(1244).and_return(fake_tags_data)
      allow(mock_client).to receive(:tours).with(1244, 'transfer').and_return(fake_tours_data)
    end

    it 'creates a categorization with correct params' do
      expect { FetchCategorizations.call }.to change { Categorization.count }.by(1)
      expect(Categorization.last).to have_attributes(
        tag_id: 1554,
        tour_id: tour.id
      )
    end
  end
end

# rubocop:enable Metrics/BlockLength
