# frozen_string_literal: true

class Location < ApplicationRecord
  include Concerns::Regionable

  enum state: REGIONS

  has_many :branches, through: :branch_locations, dependent: :restrict_with_error
  has_many :events, dependent: :restrict_with_error

  def self.upsert!(blob)
    Location.find_or_initialize_by(id: blob['id']).tap do |location|
      location.id = blob['id']
      location.state = blob['state'].strip.upcase
      location.address = blob['address'].strip
      location.name = blob['name'].strip
    end.save!

    BranchLocation.find_or_create_by!(
      branch_id: blob['branch_id'],
      location_id: blob['id']
    )
  rescue ActiveRecord::RecordNotUnique
    # nop
  rescue ArgumentError
    # nop
  end
end
