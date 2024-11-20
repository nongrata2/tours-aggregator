# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe FetchTags do
  describe '.call' do
    let!(:tour) { create(:tour, title: 'example title', sputnik_id: 1) }

    fake_tags_data = {
      'data' => [
        {
          'name' => 'example name',
          'id' => 1,
          'slug' => 'transfer',
          'photo_url' => 'example url',
          'activities_count' => 12
        }
      ]
    }

    before do
      mock_client = instance_double('SputnikApi::Client')
      allow(SputnikApi::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:categories).and_return(fake_tags_data)
    end

    it 'creates a tag with correct params' do
      expect { FetchTags.call }.to change { Tag.count }.by(1)
      expect(Tag.last).to have_attributes(
        name: 'example name',
        sputnik_id: 1,
        slug: 'transfer',
        photo_url: 'example url',
        activities_count: 12
      )
    end
  end
end

# rubocop:enable Metrics/BlockLength
