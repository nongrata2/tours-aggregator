# frozen_string_literal: true

FactoryBot.define do
  factory :tour do
    sputnik_id { 500 }
    association :city

    trait :without_sputnik_id do
      sputnik_id { nil }
    end

    trait :without_city_id do
      city_id { nil }
    end
  end
end
