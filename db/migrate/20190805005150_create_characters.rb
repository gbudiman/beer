# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.belongs_to :player
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.integer :xp_legacy, null: false, default: 0
      t.integer :xp_earned, null: false, default: 0
      t.integer :body, null: false, default: 0
      t.integer :mind, null: false, default: 0
      t.integer :resolve, null: false, default: 0
      t.integer :infection, null: false, default: 0
      t.integer :death, null: false, default: 0
      t.integer :strain_id, null: false, default: 0
      t.integer :faith_id, null: false, default: 0
      t.integer :skill_ids, array: true, null: false, default: []
      t.integer :lore_ids, array: true, null: false, default: []

      t.timestamps
    end
  end
end
