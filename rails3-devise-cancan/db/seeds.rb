# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin User', :email => 'admin@example.com', :password => 'administrator', :password_confirmation => 'administrator'
puts 'New User Created: ' << user.name
puts 'ASSIGNING ROLE TO DEFAULT USER'
role = Role.create! :name => 'Administrator', :description => 'User who has control over add/edit/delete/view actions for users and roles and assigning roles to users', :role_type => 1
user.roles << role
puts "Assigned role [#{role.name}] having role type [#{role.role_type}] to default user [#{user.name}]"  
