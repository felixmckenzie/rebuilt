class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :watches, :watched_listing_id, :listing_id
    rename_column :watches, :watcher_id, :user_id 
  end
end
