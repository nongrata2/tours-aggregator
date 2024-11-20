# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  let(:without_visit_id_recom) { build :recommendation, :without_visit_id }
  let(:without_tour_id_recom) { build :recommendation, :without_tour_id }
  let(:recommendation) { build :recommendation, tour: tour }
  let(:tour) { create :tour, city: city }
  let(:city) { create :city }

  it 'is invalid without visit_id' do
    expect(without_visit_id_recom).not_to be_valid
  end

  it 'is invalid without tour_id' do
    expect(without_tour_id_recom).not_to be_valid
  end

  it 'valid with tour_id and visit_id' do
    expect(recommendation).to be_valid
  end
end
