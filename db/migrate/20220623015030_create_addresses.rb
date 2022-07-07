# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
