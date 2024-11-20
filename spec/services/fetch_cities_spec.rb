# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe FetchCities do
  describe '.call' do
    fake_cities_data = {
      'data' => [
        {
          'name' => 'Test City 1',
          'id' => 101,
          'region_id' => 10,
          'photo_url' => 'http://example.com/photo1.jpg',
          'activities_count' => 3,
          'slug' => 'test-city-1',
          'guides_count' => 4,
          'reviews_count' => 5
        }
      ]
    }

    before do
      mock_client = instance_double('SputnikApi::Client')
      allow(SputnikApi::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:cities).and_return(fake_cities_data)
    end

    it 'creates a city with correct params' do
      expect { FetchCities.call }.to change { City.count }.by(1)
      expect(City.last).to have_attributes(
        name: 'Test City 1',
        region_id: 10,
        photo_url: 'http://example.com/photo1.jpg',
        activities_count: 3,
        slug: 'test-city-1',
        guides_count: 4,
        reviews_count: 5
      )
    end
  end
end

# rubocop:enable Metrics/BlockLength
