# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

# class for ordering tours
class ToursQuery
  class << self
    def call(filters: {}, sort_flag: nil)
      tours = filter_by_conditions(Tour.all, filters)
      sort_by(sort_flag, tours)
    end

    private

    def filter_by_conditions(tours, filters)
      tours = tours.joins(:tags).where(tags: { name: filters[:tag] }) if filters[:tag].present?
      if filters[:offers].present?
        proposal_ids = filters[:offers].pluck(:proposal_id)
        tours = tours.where(id: proposal_ids)
      end

      tours = tours.where(city_id: filters[:city_id]) if filters[:city_id].present?
      tours
    end

    def sort_by(flag, tours)
      return tours if flag.nil?

      case flag.split.first
      when 'duration'
        sort_by_duration(flag, tours)
      when 'price'
        sort_by_cost(flag, tours)
      when 'weight'
        sort_by_weight(tours)
      else
        tours
      end
    end

    def sort_by_duration(flag, tours)
      direction = flag.split.last.to_sym
      tours.order(duration: direction)
    end

    def sort_by_cost(flag, tours)
      descending = flag == 'price desc'
      sorted_tours = tours.to_a.sort_by do |tour|
        ConvertationToRubles.convert_to_rubles(tour.formatted_price)
      end
      sorted_tours.reverse! if descending
      order_expression = sorted_tours.map.with_index do |tour, index|
        "WHEN #{tour.id} THEN #{index}"
      end.join(' ')
      Tour.where(id: sorted_tours.map(&:id))
          .order(Arel.sql("CASE id #{order_expression} END"))
    end

    def sort_by_weight(tours)
      tour_weights = WeightCalculations.create_extra_columns(tours)

      sorted_tour_ids = tour_weights.sort_by { |_, weight| -weight }.map(&:first)

      order_expression = sorted_tour_ids.map.with_index { |id, index| "WHEN #{id} THEN #{index}" }.join(' ')
      Tour.where(id: sorted_tour_ids).order(Arel.sql("CASE id #{order_expression} END"))
    end
  end
end

# rubocop:enable Metrics/MethodLength
