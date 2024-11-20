# frozen_string_literal: true

# rubocop:disable Lint/UnusedMethodArgument

# class for ordering cities
class CitiesQuery
  class << self
    def call(sort_flag, filters: {})
      cities = City.all
      sort_by(sort_flag, cities)
    end

    private

    def sort_by(flag, cities)
      return cities if flag.nil?

      case flag.split.first
      when 'activities_count'
        sort_by_activities_count(flag, cities)
      when 'alphabet'
        cities.order('name ASC')
      else
        cities
      end
    end

    def sort_by_activities_count(flag, cities)
      direction = flag.split.last.to_sym
      cities.order(activities_count: direction)
    end
  end
end

# rubocop:enable Lint/UnusedMethodArgument
