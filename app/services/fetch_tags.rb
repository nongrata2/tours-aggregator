# frozen_string_literal: true

# class for rake task for Tag model
class FetchTags
  class << self
    def call
      client = SputnikApi::Client.new
      City.pluck(:sputnik_id).each do |city_id|
        tags_info = client.categories(city_id)['data']
        tags_info.each do |tag|
          create_tag(tag)
        end
      end
    end

    private

    def create_tag(tag)
      Tag.create(
        name: tag['name'],
        sputnik_id: tag['id'],
        slug: tag['slug'],
        photo_url: tag['photo_url'],
        activities_count: tag['activities_count']
      )
    end
  end
end
