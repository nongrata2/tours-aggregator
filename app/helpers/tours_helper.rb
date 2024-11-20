# frozen_string_literal: true

# helper module for tours
module ToursHelper
  def show_image_tour(tour)
    if tour.original_photo.present?
      tour.original_photo
    else
      asset_path('cityasset.png')
    end
  end

  def reviews_numeric(count)
    "#{count} #{Russian.p(count, 'отзыв', 'отзыва', 'отзывов')}"
  end
end
