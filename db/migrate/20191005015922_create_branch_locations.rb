# frozen_string_literal: true

class CreateBranchLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :branch_locations do |t|
      t.belongs_to :branch
      t.belongs_to :location

      t.timestamps
    end

    add_index :branch_locations, %i[branch_id location_id], unique: true
  end
end
