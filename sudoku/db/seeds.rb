# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', '1111.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Contry.new
  t.continent = row['continent']
  t.cont_image = row['cont_image']
  t.cont_name = row['cont_name']
	t.center = row['center']
	t.pop = row['pop']
  t.area = row['area']
  t.money = row['money']
  t.lang = row['lang']
  t.religion = row['religion']
  t.save
end
