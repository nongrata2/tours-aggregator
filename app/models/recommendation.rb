# frozen_string_literal: true

# model for fetched from csv data
class Recommendation < ApplicationRecord
  belongs_to :tour
  validates :visit_id, presence: true
  validates :tour_id, presence: true
end
