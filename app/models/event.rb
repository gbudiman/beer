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
    30,
  )

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

    scope.order(start: :desc)
  end
end
