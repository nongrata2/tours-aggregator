# frozen_string_literal: true

namespace :data do
  task fetch_cities: :environment do
    FetchCities.call
  end
end
