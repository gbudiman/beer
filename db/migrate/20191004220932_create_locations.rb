# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :state, null: false, default: 0
      t.string :address, null: false

      t.timestamps
    end

    add_index :locations, %i[state address], unique: true
  end
end
