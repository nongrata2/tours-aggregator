# frozen_string_literal: true

# adding extra fields to tags model
class AddFieldsToTags < ActiveRecord::Migration[6.1]
  def change
    change_table :tags do |t|
      t.integer :sputnik_id, null: false
      t.string :description, null: false
      t.string :short_name
      t.string :url
      t.string :slug
    end
    change_column_null(:tags, :name, false, 'Untitled')
  end
end
