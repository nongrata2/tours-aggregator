# frozen_string_literal: true

FactoryBot.define do
  factory :recommendation do
    visit_id { 5 }
    association :tour

    trait :without_visit_id do
      visit_id { nil }
    end

    trait :without_tour_id do
      tour_id { nil }
    end
  end
end
