# frozen_string_literal: true

class Branch < ApplicationRecord
  include Concerns::Regionable

  enum state: REGIONS

  has_many :locations
  has_many :events, dependent: :restrict_with_error
end
