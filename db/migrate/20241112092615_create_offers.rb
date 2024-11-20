# frozen_string_literal: true

# creating table for offers
class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :tour, null: false, foreign_key: true
      t.bigint :proposal_id, null: false
      t.timestamps
    end
  end
end
