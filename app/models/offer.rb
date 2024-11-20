# frozen_string_literal: true

# model for offers
class Offer < ApplicationRecord
  belongs_to :tour
  validates :proposal_id, presence: true
  validates :tour_id, presence: true
end
