# frozen_string_literal: true

# class for fetching data for categorizations
class FetchCategorizations
  class << self
    def call
      client = SputnikApi::Client.new
      City.pluck(:sputnik_id).each do |city_id|
        process_cities_data(client, city_id)
      end
    end

    private

    def process_cities_data(client, city_id)
      tags_info = client.categories(city_id)['data']
      tags_info.each do |tag|
        next if (tag['activities_count']).zero?

        process_tour_info(client, city_id, tag)
      end
    end

    def create_categorization(tour_id, tag_id)
      Categorization.create!(
        tour_id: tour_id,
        tag_id: tag_id
      )
    end

    def process_tour_info(client, city_id, tag)
      tour_info = client.tours(city_id, tag['slug'])['data']
      tour_info.each do |tour|
        tour_record = Tour.find_by(sputnik_id: tour['id'])
        tag_record = Tag.find_by(slug: tag['slug'])
        create_categorization(tour_record.id, tag_record.id)
      end
    end
  end
end
