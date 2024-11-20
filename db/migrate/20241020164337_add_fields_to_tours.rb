# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# adding fields to tours model
class AddFieldsToTours < ActiveRecord::Migration[6.1]
  def change
    change_table :tours do |t|
      t.integer :sputnik_id, null: false
      t.string :language
      t.string :title, null: false
      t.string :short_name
      t.string :ticket_type
      t.boolean :is_base
      t.string :price_per
      t.integer :country_id
      t.string :original_photo
    end
    change_column_null(:tours, :name, false, 'Untitled')
  end
end
# rubocop:enable Metrics/MethodLength
