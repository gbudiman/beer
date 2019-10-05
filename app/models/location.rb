# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :branch

  has_many :branches, through: :branch_locations
end
