# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :branch
  belongs_to :location

  def self.upsert!(blob)
    Event.find_or_initialize_by(id: blob['id']).tap do |event|
      event.id = blob['id']
      event.name = blob['name']
      event.location_id = blob['location_id']
      event.branch_id = blob['branch_id']
      event.start = Time.parse(blob['start_date'])
      event.end = Time.parse(blob['end_date'])
    end.save!
  rescue ActiveRecord::RecordNotUnique
    # nop
  rescue ActiveRecord::RecordInvalid
    # nop
  end
end
