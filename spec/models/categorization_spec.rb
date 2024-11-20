# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  let(:tour) { create :tour }
  let(:tag) { create :tag }
  let(:categorization) { build :categorization, tour: tour, tag: tag }
  let(:without_tag_id_categorization) { build :categorization, :without_tag_id }
  let(:without_tour_id_categorization) { build :categorization, :without_tour_id }

  it 'invalid without tag_id' do
    expect(without_tag_id_categorization).not_to be_valid
  end

  it 'invalid without tour_id' do
    expect(without_tour_id_categorization).not_to be_valid
  end

  it 'valid with tour_id and tag_id' do
    expect(categorization).to be_valid
  end
end
