# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_241_118_234_011) do
  create_table 'categorizations', force: :cascade do |t|
    t.integer 'tag_id', null: false
    t.integer 'tour_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['tag_id'], name: 'index_categorizations_on_tag_id'
    t.index ['tour_id'], name: 'index_categorizations_on_tour_id'
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sputnik_id', null: false
    t.integer 'region_id'
    t.string 'photo_url'
    t.integer 'activities_count'
    t.string 'slug'
    t.integer 'guides_count'
    t.integer 'reviews_count'
  end

  create_table 'offers', force: :cascade do |t|
    t.integer 'tour_id', null: false
    t.bigint 'proposal_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['tour_id'], name: 'index_offers_on_tour_id'
  end

  create_table 'recommendations', force: :cascade do |t|
    t.bigint 'visit_id', null: false
    t.integer 'tour_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['tour_id'], name: 'index_recommendations_on_tour_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sputnik_id', null: false
    t.string 'slug'
    t.string 'photo_url'
    t.integer 'activities_count'
  end

  create_table 'tours', force: :cascade do |t|
    t.text 'description'
    t.integer 'city_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sputnik_id', null: false
    t.string 'language'
    t.string 'price_per'
    t.string 'original_photo'
    t.float 'reviews_rating'
    t.integer 'reviews_count'
    t.string 'title'
    t.integer 'duration'
    t.string 'formatted_price'
    t.string 'duration_text'
    t.index ['city_id'], name: 'index_tours_on_city_id'
  end

  add_foreign_key 'categorizations', 'tags'
  add_foreign_key 'categorizations', 'tours'
  add_foreign_key 'offers', 'tours'
  add_foreign_key 'recommendations', 'tours'
  add_foreign_key 'tours', 'cities'
end

# rubocop:enable Metrics/BlockLength
