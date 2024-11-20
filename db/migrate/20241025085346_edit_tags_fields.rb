# frozen_string_literal: true

# editing fields in tags table
class EditTagsFields < ActiveRecord::Migration[6.1]
  def change
    change_table :tags do |t|
      t.string :photo_url
      t.integer :activities_count
    end
    remove_column :tags, :description
    remove_column :tags, :short_name
    remove_column :tags, :url
  end
end
