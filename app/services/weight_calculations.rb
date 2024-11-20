# frozen_string_literal: true

# class for calculations for tour and tag weight
class WeightCalculations
  class << self
    def create_extra_columns(tours)
      tag_weights = calculate_tag_weights

      tours.joins(:city, :tags)
           .select('tours.id, cities.guides_count, tours.reviews_rating')
           .group('tours.id, cities.guides_count, tours.reviews_rating')
           .map { |tour| [tour.id, calculate_tour_weight(tour, tag_weights)] }
    end

    def calculate_tag_weights
      Tour.joins(:tags)
          .group('tags.id')
          .count
    end

    def calculate_tour_weight(tour, tag_weights)
      max_weight_tag = tour.tags.max_by { |tag| tag_weights[tag.id] || 0 }
      max_tag_weight = max_weight_tag ? tag_weights[max_weight_tag.id] : 0

      tour.guides_count * max_tag_weight * tour.reviews_rating
    end
  end
end
