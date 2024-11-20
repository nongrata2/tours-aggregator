# frozen_string_literal: true

# adding foreign key for tours
class AddForeignKeyTours < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tours, :cities
  end
end
