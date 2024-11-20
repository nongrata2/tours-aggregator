# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    proposal_id { 5 }
    association :tour

    trait :without_proposal_id do
      proposal_id { nil }
    end

    trait :without_tour_id do
      tour_id { nil }
    end
  end
end
