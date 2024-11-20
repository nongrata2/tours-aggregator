# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe CitiesHelper, type: :helper do
  describe '#show_image_city' do
    let(:view_context) do
      controller = ActionController::Base.new
      controller.view_context
    end
    let!(:city_with_photo) { create(:city, name: 'Архангельск', sputnik_id: 2, photo_url: 'example_url.com') }
    let!(:city_without_photo) { create(:city, name: 'Владивосток', sputnik_id: 3) }

    context 'when the city has photo_url' do
      it 'returns the photo_url path' do
        expect(helper.show_image_city(city_with_photo)).to eq('example_url.com')
      end
    end

    context 'when the city does not have an original photo' do
      it 'returns the asset path for the fallback image' do
        expect(helper.show_image_city(city_without_photo)).to eq(view_context.asset_path('cityasset.png'))
      end
    end
  end
  describe '#activities_numeric' do
    it 'returns the correct pluralization for activities' do
      expect(helper.activities_numeric(1)).to eq('1 экскурсия')
      expect(helper.activities_numeric(2)).to eq('2 экскурсии')
      expect(helper.activities_numeric(5)).to eq('5 экскурсий')
    end
  end

  describe '#guides_numeric' do
    it 'returns the correct pluralization for guides' do
      expect(helper.guides_numeric(1)).to eq('1 гид')
      expect(helper.guides_numeric(2)).to eq('2 гида')
      expect(helper.guides_numeric(5)).to eq('5 гидов')
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
