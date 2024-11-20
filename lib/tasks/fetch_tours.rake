# frozen_string_literal: true

namespace :data do
  task fetch_tours: :environment do
    FetchTours.call
  end
end
