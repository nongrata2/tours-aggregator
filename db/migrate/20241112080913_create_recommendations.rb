# frozen_string_literal: true

# class for fetched data from csv table
class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.bigint :visit_id, null: false
      t.references :tour, null: false, foreign_key: true
      t.timestamps
    end
  end
end
