# frozen_string_literal: true

FactoryBot.define do
  factory :categorization do
    association :tour
    association :tag

    trait :without_tag_id do
      tag { nil }
    end

    trait :without_tour_id do
      tour { nil }
    end
  end
end
