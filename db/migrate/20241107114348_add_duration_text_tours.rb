# frozen_string_literal: true

# adding field to tours model
class AddDurationTextTours < ActiveRecord::Migration[6.1]
  def change
    change_table :tours do |t|
      t.string :duration_text
    end
  end
end
