# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sheets = [
  [1, 1, 'a'], [2, 2, 'a'], [3, 3, 'a'], [4, 4, 'a'], [5, 5, 'a'],
  [6, 1, 'b'], [7, 2, 'b'], [8, 3, 'b'], [9, 4, 'b'], [10, 5, 'b'],
  [11, 1, 'c'], [12, 2, 'c'], [13, 3, 'c'], [14, 4, 'c'], [15, 5, 'c']
]

sheets.each do |sheet|
    Sheet.create!(
        id: sheet[0],
        column: sheet[1],
        row: sheet[2]
    )
end

