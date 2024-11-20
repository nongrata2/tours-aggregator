# frozen_string_literal: true

# edit cities fields class
class EditCitiesFields < ActiveRecord::Migration[6.1]
  def change
    change_table :cities do |t|
      t.string :photo_url
      t.integer :activities_count
      t.string :slug
      t.integer :guides_count
      t.integer :reviews_count
    end
    remove_column :cities, :country_id
  end
end
