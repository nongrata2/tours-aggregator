# frozen_string_literal: true

# controller for tours
class ToursController < ApplicationController
  DEFAULT_PER_PAGE = 6

  before_action :set_tour_presenter, only: :show

  def index
    per_page = params.fetch(:per_page, DEFAULT_PER_PAGE).to_i
    sort_flag = params[:sort_by]
    filters = { tag: params[:tag], city_id: params[:city_id] }

    @pagy, @tours = pagy(ToursQuery.call(filters: filters, sort_flag: sort_flag), items: per_page)
    @tags = Tag.all
  end

  def show
    if @tour.nil?
      redirect_to cities_path, alert: 'No such tour'
    else
      @tags = @tour.tags
      @offers = @tour.offers
    end
  end

  private

  def set_tour_presenter
    @tour = Tour.find_by(sputnik_id: params[:sputnik_id])
    return unless @tour

    @tour_presenter = ToursPresenter.new(@tour, self)
  end
end
