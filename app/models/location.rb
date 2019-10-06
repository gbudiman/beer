# frozen_string_literal: true

class Location < ApplicationRecord
  include Concerns::Regionable
  include Concerns::Upsertable

  enum state: REGIONS

  has_many :branches, through: :branch_locations, dependent: :restrict_with_error
  has_many :events, dependent: :restrict_with_error

  upsert state: :state, address: :address do |blob|
    BranchLocation.find_or_create_by!(
      branch_id: blob['branch_id'],
      location_id: blob['id']
    )
  end
end
