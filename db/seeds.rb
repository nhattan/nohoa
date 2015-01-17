# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create roles"
%w(admin user).each do |role|
  Role.create(name: role)
end

puts "Create users"
admin = User.create(email: "admin@example.com", password: "12345678")
admin.roles << Role.first
100.times do |i|
  user = User.create(email: "user_#{i}@example.com", password: "12345678")
  user.roles << Role.last	
end