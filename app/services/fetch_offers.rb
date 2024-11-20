# frozen_string_literal: true

MAX_OFFERS = 6

# class for fetching data for offers
class FetchOffers
  class << self
    def call
      Tour.find_each do |tour|
        fetch_and_create_offers(tour)
      end
    end

    private

    def fetch_and_create_offers(tour)
      related_tour_ids = OffersQuery.call(tour)
      related_tour_ids.each do |related_tour_id|
        create_offer(tour.id, related_tour_id)
      end
    end

    def create_offer(tour_id, proposal_id)
      Offer.create(
        tour_id: tour_id,
        proposal_id: proposal_id
      )
    end
  end
end
