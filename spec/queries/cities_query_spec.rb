# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesQuery do
  let!(:city1) { create :city, { name: 'Бобруйск', activities_count: 1, sputnik_id: 2 } }
  let!(:city2) { create :city, { name: 'Архангельск', activities_count: 3, sputnik_id: 3 } }
  let!(:city3) { create :city, { name: 'Владивосток', activities_count: 2, sputnik_id: 4 } }

  subject(:result) { described_class.call(sort_flag).pluck(:name) }

  describe '.call' do
    context 'when sorting by alphabet' do
      let(:sort_flag) { 'alphabet' }
      it 'sorts correct' do
        expect(result).to eq(%w[Архангельск Бобруйск Владивосток])
      end
    end
    context 'when sorting by acitivities_count desc' do
      let(:sort_flag) { 'activities_count desc' }
      it 'sorts correct' do
        expect(result).to eq(%w[Архангельск Владивосток Бобруйск])
      end
    end
    context 'when sorting by activities_count asc' do
      let(:sort_flag) { 'activities_count asc' }
      it 'sorts correct' do
        expect(result).to eq(%w[Бобруйск Владивосток Архангельск])
      end
    end
  end
end
