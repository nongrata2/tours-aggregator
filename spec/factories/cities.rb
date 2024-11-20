# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { 'default' }
    sputnik_id { 1 }

    trait :without_name do
      name { nil }
    end

    trait :without_sputnik_id do
      sputnik_id { nil }
    end

    trait :for_fetch do
      name { 'Sample City' }
      id { 1 }
      region_id { 2 }
      photo_url { 'http://example.com/photo.jpg' }
      activities_count { 5 }
      slug { 'sample-city' }
      guides_count { 3 }
      reviews_count { 10 }
    end
  end
end
