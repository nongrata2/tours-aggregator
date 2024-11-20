# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { 'default' }
    sputnik_id { 1554 }

    trait :without_name do
      name { nil }
    end

    trait :without_sputnik_id do
      sputnik_id { nil }
    end
  end
end
