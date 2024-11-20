# frozen_string_literal: true

# city model class
class City < ApplicationRecord
  has_many :tours
  validates :name, presence: true, uniqueness: true
  validates :sputnik_id, presence: true, uniqueness: true
end
