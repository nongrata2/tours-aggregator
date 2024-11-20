# frozen_string_literal: true

# class for categorizations
class Categorization < ApplicationRecord
  belongs_to :tag
  belongs_to :tour
  validates :tag_id, presence: true
  validates :tour_id, presence: true
end
