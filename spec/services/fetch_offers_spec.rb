# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchOffers do
  describe '.call' do
    let(:city1) { create(:city) }
    let!(:tour1) { create(:tour, sputnik_id: 555, city: city1) }
    let!(:tour2) { create(:tour, sputnik_id: 556, city: city1) }
    let!(:tour3) { create(:tour, sputnik_id: 557, city: city1) }
    let!(:tour4) { create(:tour, sputnik_id: 558, city: city1) }
    let!(:tour5) { create(:tour, sputnik_id: 559, city: city1) }

    before do
      create(:recommendation, visit_id: 1, tour: tour1)
      create(:recommendation, visit_id: 1, tour: tour2)
      create(:recommendation, visit_id: 1, tour: tour3)

      create(:recommendation, visit_id: 2, tour: tour2)
      create(:recommendation, visit_id: 2, tour: tour4)

      create(:recommendation, visit_id: 3, tour: tour1)
      create(:recommendation, visit_id: 3, tour: tour5)
    end

    it 'creates appropriate offers based on recommendations' do
      expect { described_class.call }.to change { Offer.count }.by(10)

      tour1_offers = Offer.where(tour_id: tour1.id).pluck(:proposal_id)
      expect(tour1_offers).to match_array([tour2.id, tour3.id, tour5.id])

      tour2_offers = Offer.where(tour_id: tour2.id).pluck(:proposal_id)
      expect(tour2_offers).to match_array([tour1.id, tour3.id, tour4.id])
    end
  end
end
