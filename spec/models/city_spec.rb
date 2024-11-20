# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:without_name_city) { build :city, :without_name }
  let(:without_sputnik_id_city) { build :city, :without_sputnik_id }
  let(:city) { build :city }

  it 'is invalid without a name' do
    expect(without_name_city).not_to be_valid
  end

  it 'is invalid without a sputnik_id' do
    expect(without_sputnik_id_city).not_to be_valid
  end

  it 'valid with name and sputnik_id' do
    expect(city).to be_valid
  end
end
