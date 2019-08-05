# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    skill_ids { [] }
    body { 0 }
    mind { 0 }
    resolve { 0 }
    infection { 0 }
  end
end
