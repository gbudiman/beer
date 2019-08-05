# frozen_string_literal: true

class Character < ApplicationRecord
  include Concerns::Skillable
  enum status: %i[active inactive retired]
  belongs_to :player
end