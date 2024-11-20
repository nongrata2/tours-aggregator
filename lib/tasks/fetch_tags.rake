# frozen_string_literal: true

namespace :data do
  task fetch_tags: :environment do
    FetchTags.call
  end
end
