# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
   User.create!( first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.free_email,
                  password: Faker::Internet.password(8))
end

recycling = Category.create!(name: "Recycling")
lang_exchange = Category.create!(name: "Language Exchange")
immig_serv = Category.create!(name: "Immigration Services")
transportation = Category.create!(name: "Transportation")
esl = Category.create!(name: "ESL")
toefl = Category.create!(name: "TOEFL")
childcare = Category.create!(name: "Childcare")
legal = Category.create!(name: "Legal")
misc = Category.create!(name: "Miscellaneous")
event = Category.create!(name: "Events")





