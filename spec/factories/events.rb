# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    branch
    location
    start {}
    name { Faker::Company.name }
  end
end
