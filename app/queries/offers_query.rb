# frozen_string_literal: true

# class for offers
class OffersQuery
  class << self
    def call(tour)
      find_recommendations(tour)
    end

    private

    def find_recommendations(tour)
      Recommendation.where(visit_id: tour.recommendations.select(:visit_id))
                    .where.not(tour_id: tour.id)
                    .group(:tour_id)
                    .order('COUNT(tour_id) DESC')
                    .limit(MAX_OFFERS)
                    .pluck(:tour_id)
    end
  end
end
