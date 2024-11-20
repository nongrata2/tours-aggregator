# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

RSpec.describe WeightCalculations do
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
           { title: 'Баня', duration: 600, sputnik_id: 3, city: city, formatted_price: '4 400 ₽',
             reviews_rating: 3.5 }
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
  end

  it 'calculates the correct weights for each tour' do
    weights = described_class.send(:create_extra_columns, Tour.all).to_h

    expect(weights[tour1.id]).to eq(80)  # 10 * 2 * 4.0
    expect(weights[tour2.id]).to eq(70)  # 10 * 2 * 3.5
    expect(weights[tour3.id]).to eq(100) # 10 * 2 * 5.0
  end
end

# rubocop:enable Metrics/BlockLength
