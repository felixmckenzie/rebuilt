class Watch < ApplicationRecord
  belongs_to :watched_listing, foreign_key: "listing_id", class_name: "Listing"
  belongs_to :watcher, foreign_key: "user_id", class_name: "User" 
  
end
