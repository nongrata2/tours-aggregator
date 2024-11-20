# frozen_string_literal: true

# editing fields in tours table
class EditToursFields < ActiveRecord::Migration[6.1]
  def change
    change_table :tours do |t|
      t.float :reviews_rating
      t.integer :reviews_count
    end
    remove_column :tours, :is_base
    remove_column :tours, :ticket_type
    remove_column :tours, :short_name
    remove_column :tours, :title
    remove_column :tours, :country_id
  end
end
