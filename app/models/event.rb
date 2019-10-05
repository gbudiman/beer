# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :branch
  belongs_to :location

  def self.upsert!(blob)
    Event.find_or_initialize_by(id: blob['id']).tap do |event|
      event.id = blob['id']
      event.name = blob['name'].strip
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

  def self.filter(params)
    event = Event.arel_table

    scope = Event.all
    if params['branches'].present?
      scope = scope.joins(:branch).where('branches.name' => params[:branches])
    end
    if params[:after].present?
      scope = scope.where(event[:start].gt(Time.parse(params[:after])))
    end
    if params[:before].present?
      scope = scope.where(event[:start].lt(Time.parse(params[:before])))
    end

    scope
  end
end
