# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe ToursHelper, type: :helper do
  describe '#show_image_tour' do
    let(:view_context) do
      controller = ActionController::Base.new
      controller.view_context
    end
    let!(:city) { create(:city, name: 'Архангельск', sputnik_id: 2) }
    let!(:tour_with_photo) do
      create(:tour, title: 'Баня', sputnik_id: 5, original_photo: 'example_url.com', city: city)
    end

    let!(:tour_without_photo) { create(:tour, title: 'Сауна', sputnik_id: 6, original_photo: nil, city: city) }

    context 'when the tour has an original photo' do
      it 'returns the original photo path' do
        expect(helper.show_image_tour(tour_with_photo)).to eq('example_url.com')
      end
    end

    context 'when the tour does not have an original photo' do
      it 'returns the asset path for the fallback image' do
        expect(helper.show_image_tour(tour_without_photo)).to eq(view_context.asset_path('cityasset.png'))
      end
    end
  end

  describe '#reviews_numeric' do
    it 'returns the correct pluralization for reviews' do
      expect(helper.reviews_numeric(1)).to eq('1 отзыв')
      expect(helper.reviews_numeric(2)).to eq('2 отзыва')
      expect(helper.reviews_numeric(5)).to eq('5 отзывов')
    end
  end
end

# rubocop:enable Metrics/BlockLength
