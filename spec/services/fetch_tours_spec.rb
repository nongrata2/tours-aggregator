# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe FetchTours do
  describe '.call' do
    let!(:city) { create(:city, name: 'name', sputnik_id: 1) }

    fake_tours_data = {
      'data' => [
        {
          'title' => 'Test Title',
          'description' => 'Test description',
          'city_id' => 1,
          'id' => 500,
          'languages_in_words' => 'russian',
          'price_type_text' => 'за человека',
          'photo_url' => 'http://example.com/photo1.jpg',
          'reviews_rating' => 5.0,
          'reviews_count' => 50,
          'duration' => 36_000,
          'formatted_price' => '5 денег'
        }
      ]
    }

    before do
      mock_client = instance_double('SputnikApi::Client')
      allow(SputnikApi::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:tours).and_return(fake_tours_data)
    end

    it 'creates a tour with correct params' do
      expect { described_class.call }.to change { Tour.count }.by(1)

      expect(Tour.last).to have_attributes(
        title: 'Test Title',
        description: 'Test description',
        city_id: city.id,
        sputnik_id: 500,
        language: 'russian',
        price_per: 'за человека',
        original_photo: 'http://example.com/photo1.jpg',
        reviews_rating: 5.0,
        reviews_count: 50,
        duration: 36_000,
        formatted_price: '5 денег'
      )
    end
  end
end

# rubocop:enable Metrics/BlockLength
