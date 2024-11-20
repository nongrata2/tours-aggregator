# frozen_string_literal: true

# class for rake task for City model
class FetchCities
  class << self
    def call
      client = SputnikApi::Client.new
      cities_info = client.cities['data']
      cities_info.each do |city|
        create_city(city)
      end
    end

    private

    def create_city(city)
      City.create(
        name: city['name'],
        sputnik_id: city['id'],
        region_id: city['region_id'],
        photo_url: city['photo_url'],
        activities_count: city['activities_count'],
        slug: city['slug'],
        guides_count: city['guides_count'],
        reviews_count: city['reviews_count']
      )
    end
  end
end
