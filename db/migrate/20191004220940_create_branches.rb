# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.integer :state, null: false, default: 0
      t.string :name, null: false

      t.timestamps
    end

    add_index :branches, %i[state name], unique: true
  end
end
