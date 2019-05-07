# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Start of Seeding..."

puts 'Creating an admin user'
User.new({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => 'true'}).save

puts "Seeding Over"