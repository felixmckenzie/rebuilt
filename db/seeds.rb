# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ['timber', 'windows', 'paint', 'fencing', 'tiles',
              'kitchen', 'steel', 'doors', 'plasterboard', 'bathroom',
              'garden', 'corrugated iron', 'flooring', 'insulation',
              'bricks', 'pavers', 'gates', 'concrete', 'plywood', 'roofing']

if Category.count.zero?
  categories.each do |category|
    Category.create(name: category)
    puts "created #{category} category"
  end
end
