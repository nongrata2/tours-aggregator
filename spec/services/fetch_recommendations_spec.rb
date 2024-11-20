# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe FetchRecommendations do
  describe '.call' do
    let(:file_path) { File.expand_path('../../recommendation_algorithm.csv', __dir__) }

    let(:csv_content) do
      <<~CSV
        visit_id,activity_id
        947497210,55175
        947497439,59938
      CSV
    end

    before do
      allow(CSV).to receive(:foreach).and_yield(
        CSV::Row.new(%w[visit_id activity_id], %w[947497210 55175])
      )

      allow(Tour).to receive(:find_by).with(sputnik_id: '55175').and_return(tour)
    end

    context 'when tour is found' do
      let(:tour) { build :tour }

      it 'creates recommendations' do
        expect(Recommendation).to receive(:create).with(
          visit_id: '947497210',
          tour_id: tour.id
        )

        described_class.call(file_path)
      end
    end

    context 'when tour is not found' do
      let(:tour) { nil }

      it 'does not create recommendations' do
        expect(Recommendation).not_to receive(:create)

        described_class.call(file_path)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
