class CreateWatches < ActiveRecord::Migration[6.1]
  def change
    create_table :watches do |t|
      t.references :watched_listing, null: false, foreign_key: true
      t.references :watcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
