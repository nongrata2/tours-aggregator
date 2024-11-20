# frozen_string_literal: true

# tour model class
class Tour < ApplicationRecord
  has_many :categorizations
  has_many :offers
  has_many :tags, through: :categorizations
  has_many :recommendations
  belongs_to :city

  validates :city_id, presence: true
  validates :sputnik_id, presence: true, uniqueness: true
end
