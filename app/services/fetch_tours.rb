# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

# class for rake task for City model
class FetchTours
  class << self
    def call
      client = SputnikApi::Client.new
      City.pluck(:sputnik_id).each do |city_id|
        tours_info = client.tours(city_id)['data']
        tours_info.each do |tour|
          create_tour(tour)
        end
      end
    end

    private

    def create_tour(tour)
      city = City.find_by(sputnik_id: tour['city_id'])
      Tour.create!(
        duration_text: tour['duration_text'],
        title: tour['title'],
        description: tour['description'],
        city_id: city.id,
        sputnik_id: tour['id'],
        language: tour['languages_in_words'],
        price_per: tour['price_type_text'],
        original_photo: tour['photo_url'],
        reviews_rating: tour['reviews_rating'],
        reviews_count: tour['reviews_count'],
        duration: tour['duration'],
        formatted_price: tour['formatted_price']
      )
    end
  end
end

# rubocop:enable Metrics/MethodLength
