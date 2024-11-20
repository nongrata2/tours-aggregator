# frozen_string_literal: true

module SputnikApi
  # class for working with sputnikapi
  class Client
    API_ENDPOINT = 'https://api.sputnik8.com/graph/v1'

    def cities
      request(
        http_method: :get,
        endpoint: 'cities',
        params: { active_only: true, limit: 50, offset: 0 }
      )
    end

    def tours(city_id = nil, category_slug = nil, limit = 50)
      params = { limit: limit }
      params[:city_id] = city_id unless city_id.nil?
      params[:category_slug] = category_slug unless category_slug.nil?

      request(
        http_method: :get,
        endpoint: 'activities',
        params: params
      )
    end

    def categories(city_id = nil, limit = 50)
      params = { limit: limit }
      params[:city_id] = city_id unless city_id.nil?

      request(
        http_method: :get,
        endpoint: 'categories',
        params: params
      )
    end

    private

    def client
      @client ||= Faraday.new(API_ENDPOINT) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      raise "Request failed with status: #{response.status}" unless response.success?

      Oj.load(response.body)
    end
  end
end
