# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :branch
  belongs_to :location
end
