# frozen_string_literal: true

class CreateWatches < ActiveRecord::Migration[6.1]
  def change
    create_table :watches do |t|
      t.references :watched_listing, null: false, foreign_key: { to_table: :listings }
      t.references :watcher, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
