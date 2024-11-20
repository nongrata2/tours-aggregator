# frozen_string_literal: true

require 'csv'

# class for fetching data from csv
class FetchRecommendations
  class << self
    def call(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        process_row(row)
      end
    end

    private

    def process_row(row)
      visit_id = row['visit_id']
      activity_id = row['activity_id']

      tour = Tour.find_by(sputnik_id: activity_id)

      create_recommendation(visit_id, tour.id) if tour
    end

    def create_recommendation(visit_id, tour_id)
      Recommendation.create(
        visit_id: visit_id,
        tour_id: tour_id
      )
    end
  end
end
