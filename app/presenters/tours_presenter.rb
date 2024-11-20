# frozen_string_literal: true

# class for tour presenter
class ToursPresenter
  def initialize(tour, view_context)
    @tour = tour
    @view_context = view_context
  end

  def recommended_tours(offers)
    ToursQuery.call(filters: { offers: offers })
  end
end
