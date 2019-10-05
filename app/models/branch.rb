# frozen_string_literal: true

class Branch < ApplicationRecord
  include Concerns::Regionable

  enum state: REGIONS

  has_many :locations
  has_many :events, dependent: :restrict_with_error

  def self.upsert!(blob)
    Branch.find_or_initialize_by(id: blob['id']).tap do |branch|
      branch.id = blob['id']
      branch.state = blob['short_name'].strip.upcase
      branch.name = blob['name'].strip
    end.save!
  end
end
