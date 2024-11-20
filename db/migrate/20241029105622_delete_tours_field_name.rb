# frozen_string_literal: true

# changing name field to title field
class DeleteToursFieldName < ActiveRecord::Migration[6.1]
  def change
    change_table :tours do |t|
      t.string :title
      t.integer :duration
      t.string :formatted_price
    end
    remove_column :tours, :name
  end
end
