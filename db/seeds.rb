# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  user = User.new(
    email: Faker::Internet.email ,
    password: 'grumble'
  )
  user.save!
end

20.times do
  island = Island.new(
    name: Faker::Nation.capital_city,
    price: rand(500_000..1_000_000),
    location: Faker::WorldCup.team,
    squarekm: rand(30_000..200_000),
    number_of_villas: rand(20..50),
    guests: rand(50..200),
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(30..60),
    yachts: rand(10..20),
    user: User.all.sample
  )
  island.save!
end
