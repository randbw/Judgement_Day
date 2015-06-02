# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Vote.destroy_all
Argument.destroy_all


u1 = User.create :username => 'randlemere III', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :username => 'Tony Abbott', :password => 'chicken', :password_confirmation => 'chicken'
u3 = User.create :username => 'Jeff Jefferson', :password => 'chicken', :password_confirmation => 'chicken'

a1 = Argument.create :user_id => u1.id, :content => "My friend didn't buy his round of drinks but bought himself a quinoa salad. he owes me a drink.", :title => "tightass m8"
a2 = Argument.create :user_id => u2.id, :content => "The boat people want to come in but they have funny sounding accents so we shouldn't let them into our country.", :title => "Xenophbia"
a3 = Argument.create :user_id => u3.id, :content => "You can find true happiness and love with a /b/tard", :title => 'foreveralone.jpg?'

v1 = Vote.create :user_id => u1.id, :argument_id => a2.id
v2 = Vote.create :agree => true, :user_id => u2.id, :argument_id => a1.id
v3 = Vote.create :agree => true, :user_id => u3.id, :argument_id => a1.id
v4 = Vote.create :argument_id => a2.id
v5 = Vote.create :agree => true, :argument_id => a1.id
v6 = Vote.create :agree => true, :argument_id => a1.id
v7 = Vote.create :argument_id => a3.id








