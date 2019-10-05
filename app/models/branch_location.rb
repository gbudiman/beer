# frozen_string_literal: true

class BranchLocation < ApplicationRecord
  belongs_to :branch
  belongs_to :location
end
