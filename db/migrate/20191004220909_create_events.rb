# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.string :name, null: false
      t.belongs_to :branch
      t.belongs_to :location

      t.timestamps
    end

    add_index :events, %i[branch_id location_id start], unique: true
    add_index :events, :start
  end
end
