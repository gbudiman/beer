# frozen_string_literal: true

class Event < ApplicationRecord
  include Concerns::Upsertable

  belongs_to :branch
  belongs_to :location

  upsert location_id: :location_id, branch_id: :branch_id, start_date: :start, end_date: :end
  blacklist(
    # GA
    11,
    16,
    # IN
    31,
    # MA
    17,
    # NJ
    28,
    29,
    # NM
    13,
    14,
    # OK
    32,
    # OR:
    18,
    19,
    20,
    22,
    23,
    24,
    25,
    # TX
    30
  )

  scope :after, ->(date) { where('start > :t', t: date) }
  scope :before, ->(date) { where('start < :t', t: date) }
  scope :branches, ->(branches) { joins(:branch).where('branches.name' => branches) }

  def self.filter(params)
    query = Event.all.order(start: :desc)
    query = query.after(Time.parse(params[:after])) if params[:after].present?
    if params[:before].present?
      query = query.before(Time.parse(params[:before]))
    end
    query = query.branches(params[:branches]) if params[:branches].present?

    query
  end
end
