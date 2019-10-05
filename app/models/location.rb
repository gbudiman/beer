# frozen_string_literal: true

class Location < ApplicationRecord
  include Concerns::Regionable

  enum state: REGIONS

  belongs_to :branch

  has_many :branches, through: :branch_locations, dependent: :restrict_with_error
  has_many :events, dependent: :restrict_with_error
end
