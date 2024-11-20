# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/sputnik_api/client'

RSpec.describe SputnikApi::Client do
  describe '#cities' do
    it 'success request to cities' do
      stub_request(:get, %r{#{SputnikApi::Client::API_ENDPOINT}/cities.*})
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      client = SputnikApi::Client.new
      response = client.cities
      expect(response).to eq('data' => [])
    end
  end

  describe '#tours' do
    it 'success request to tours' do
      stub_request(:get, %r{#{SputnikApi::Client::API_ENDPOINT}/activities.*})
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      client = SputnikApi::Client.new
      response = client.tours
      expect(response).to eq('data' => [])
    end
  end

  describe '#categories' do
    it 'success request to categories' do
      stub_request(:get, %r{#{SputnikApi::Client::API_ENDPOINT}/categories.*})
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      client = SputnikApi::Client.new
      response = client.categories
      expect(response).to eq('data' => [])
    end
  end
end
# rubocop:enable Metrics/BlockLength
