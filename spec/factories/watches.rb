# frozen_string_literal: true

FactoryBot.define do
  factory :watch do
    watched_listing { nil }
    watcher { nil }
  end
end
