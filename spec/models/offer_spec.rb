# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  let(:without_proposal_id_offer) { build :offer, :without_proposal_id }
  let(:without_tour_id_offer) { build :offer, :without_tour_id }
  let(:offer) { build :offer, tour: tour }
  let(:tour) { create :tour, city: city }
  let(:city) { create :city }

  it 'is invalid without proposal_id' do
    expect(without_proposal_id_offer).not_to be_valid
  end

  it 'is invalid without tour_id' do
    expect(without_tour_id_offer).not_to be_valid
  end

  it 'valid with tour_id and visit_id' do
    expect(offer).to be_valid
  end
end
