# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { Faker::Company.name }
    state { 0 }
    address { Faker::Address.street_address }
  end
end
