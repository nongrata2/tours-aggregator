# frozen_string_literal: true

namespace :data do
  task fetch_categorizations: :environment do
    FetchCategorizations.call
  end
end
