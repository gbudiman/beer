# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :characters, dependent: :destroy
end