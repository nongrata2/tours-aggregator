# frozen_string_literal: true

# create tours db
class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.references :city, null: false

      t.timestamps
    end
  end
end
