# frozen_string_literal: true

# adding extra fields to city model
class AddFieldsToCities < ActiveRecord::Migration[6.1]
  def change
    change_table :cities do |t|
      t.integer :sputnik_id, null: false
      t.integer :country_id
      t.integer :region_id
    end
    change_column_null(:cities, :name, false, 'Untitled')
  end
end
