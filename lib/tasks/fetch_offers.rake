# frozen_string_literal: true

namespace :data do
  task fetch_offers: :environment do
    FetchOffers.call
  end
end
