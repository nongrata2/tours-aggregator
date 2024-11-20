# frozen_string_literal: true

namespace :data do
  task fetch_recommendations: :environment do
    FetchRecommendations.call(File.expand_path('../../recommendation_algorithm.csv', __dir__))
  end
end
