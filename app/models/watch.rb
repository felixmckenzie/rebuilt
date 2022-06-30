class Watch < ApplicationRecord
  belongs_to :watched_listing, foreign_key: "watched_listing_id", class_name: "Listing"
  belongs_to :watcher, foreign_key: "watcher_id", class_name: "User" 
end
