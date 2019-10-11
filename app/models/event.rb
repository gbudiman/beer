# frozen_string_literal: true

class Event < ApplicationRecord
  include Concerns::Upsertable

  belongs_to :branch
  belongs_to :location, optional: true

  upsert location_id: :location_id, branch_id: :branch_id, start_date: :start, end_date: :end
  blacklist(
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    # CO
    42,
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
    # OH
    50,
    51,
    52,
    53,
    54,
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
    44,
    # TX
    30,
    38
  )

  scope :after, ->(date) { where('start > :t', t: date) }
  scope :before, ->(date) { where('start < :t', t: date) }
  scope :branches, ->(branches) { joins(:branch).where('branches.name' => branches) }

  def self.filter(params)
    query = Event.all.order(start: :desc)
    query = query.after(Time.parse(params[:after])) if params[:after].present?
    query = query.before(Time.parse(params[:before])) if params[:before].present?
    query = query.branches(params[:branches]) if params[:branches].present?

    query
  end
end
