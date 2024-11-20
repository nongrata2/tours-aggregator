# frozen_string_literal: true

# tag model class
class Tag < ApplicationRecord
  has_many :categorizations
  has_many :tours, through: :categorizations

  validates :name, presence: true, uniqueness: true
  validates :sputnik_id, presence: true
end
