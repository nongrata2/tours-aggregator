# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tour, type: :model do
  let(:city) { create :city }
  let(:without_sputnik_id_tour) { build :tour, :without_sputnik_id }
  let(:without_city_id_tour) { build :tour, :without_city_id }
  let(:tour) { build :tour, city: city }

  it 'is invalid without sputnik_id' do
    expect(without_sputnik_id_tour).not_to be_valid
  end

  it 'is invalid without city_id' do
    expect(without_city_id_tour).not_to be_valid
  end

  it 'is valid with city_id and sputnik_id' do
    expect(tour).to be_valid
  end
end
