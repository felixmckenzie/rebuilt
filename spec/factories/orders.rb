# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    listing { nil }
    buyer { nil }
    seller { nil }
  end
end
