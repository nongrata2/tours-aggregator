# frozen_string_literal: true

# class controller for cities
class CitiesController < ApplicationController
  DEFAULT_PER_PAGE = 8

  def index
    per_page = params.fetch(per_page, DEFAULT_PER_PAGE).to_i
    @pagy, @cities = pagy(CitiesQuery.call(params[:sort_by], filters: {}), items: per_page)
  end
end
