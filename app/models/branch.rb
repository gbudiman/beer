# frozen_string_literal: true

class Branch < ApplicationRecord
  include Concerns::Regionable
  include Concerns::Upsertable

  enum state: REGIONS

  has_many :locations
  has_many :events, dependent: :restrict_with_error

  upsert short_name: :state
end
