# frozen_string_literal: true

# helper module for cities
module CitiesHelper
  def show_image_city(city)
    if city.photo_url.present?
      city.photo_url
    else
      asset_path('cityasset.png')
    end
  end

  def reviews_numeric(count)
    "#{count} #{Russian.p(count, 'отзыв', 'отзыва', 'отзывов')}"
  end

  def activities_numeric(count)
    "#{count} #{Russian.p(count, 'экскурсия', 'экскурсии', 'экскурсий')}"
  end

  def guides_numeric(count)
    "#{count} #{Russian.p(count, 'гид', 'гида', 'гидов')}"
  end
end
