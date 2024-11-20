# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe ToursQuery do
  let!(:city) { create(:city, { name: 'Архангельск', sputnik_id: 5, guides_count: 10 }) }

  let!(:tag1) { create(:tag, name: 'tag1') }
  let!(:tag2) { create(:tag, name: 'tag2') }
  let!(:tag3) { create(:tag, name: 'tag3') }

  let!(:tour1) do
    create :tour,
           { title: 'Водохранилище', duration: 500, sputnik_id: 2, city: city, formatted_price: '£ 69',
             reviews_rating: 4.0 }
  end

  let!(:tour2) do
    create :tour,
           { title: 'Баня', duration: 600, sputnik_id: 3, city: city, formatted_price: '4 400 ₽', reviews_rating: 3.5 }
  end

  let!(:tour3) do
    create :tour,
           { title: 'Мечеть', duration: 400, sputnik_id: 4, city: city, formatted_price: '$ 40', reviews_rating: 5.0 }
  end

  before do
    create(:categorization, tour: tour1, tag: tag1)
    create(:categorization, tour: tour1, tag: tag2)
    create(:categorization, tour: tour2, tag: tag2)
    create(:categorization, tour: tour3, tag: tag1)
    create(:categorization, tour: tour3, tag: tag3)

    create(:offer, tour_id: tour1.id, proposal_id: tour2.id)
    create(:offer, tour_id: tour1.id, proposal_id: tour3.id)
    create(:offer, tour_id: tour2.id, proposal_id: tour3.id)
  end

  describe '.call' do
    subject(:result) { described_class.call(filters: { tag: tag, offers: offers }, sort_flag: sort_flag).pluck(:title) }

    let(:sort_flag) { nil }
    let(:tag) { nil }
    let(:offers) { nil }

    context 'when sorting by duration asc' do
      let(:sort_flag) { 'duration asc' }
      it 'sorts correctly' do
        expect(result).to eq(%w[Мечеть Водохранилище Баня])
      end
    end

    context 'when sorting by duration desc' do
      let(:sort_flag) { 'duration desc' }
      it 'sorts correctly' do
        expect(result).to eq(%w[Баня Водохранилище Мечеть])
      end
    end

    context 'when sorting by price asc' do
      let(:sort_flag) { 'price asc' }
      it 'sorts correctly' do
        expect(result).to eq(%w[Мечеть Баня Водохранилище])
      end
    end

    context 'when sorting by price desc' do
      let(:sort_flag) { 'price desc' }
      it 'sorts correctly' do
        expect(result).to eq(%w[Водохранилище Баня Мечеть])
      end
    end

    context 'when sorting by weight' do
      let(:sort_flag) { 'weight' }
      it 'sorts correctly' do
        expect(result).to eq(%w[Мечеть Водохранилище Баня])
      end
    end

    context 'when filtering with tag' do
      let(:tag) { 'tag1' }
      it 'filters correct' do
        expect(result).to contain_exactly('Водохранилище', 'Мечеть')
      end
    end

    context 'when filtering with non_existing_tag' do
      let(:tag) { 'non_existing_tag' }
      it 'filters correct' do
        expect(result).to be_empty
      end
    end

    context 'when filtering with offers filter' do
      let(:offers) { tour1.offers }
      it 'filters correct' do
        expect(result).to contain_exactly('Баня', 'Мечеть')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
