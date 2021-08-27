require 'faker'
require "open-uri"
require 'pry'

Island.destroy_all
User.destroy_all

images = ["https://loveincorporated.blob.core.windows.net/contentimages/gallery/b6ecbc59-1f98-4069-b912-6dc29a8a49e1-small_islands_mihiri.jpg",
"https://media.nationalgeographic.org/assets/photos/000/268/26833.jpg",
"https://cdn.britannica.com/15/162615-131-0CBB2CBE/island-Caribbean.jpg",
"https://www.worldatlas.com/r/w1200/upload/30/71/0b/shutterstock-225128794.jpg",
"https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2Fb9ba28b8-74e8-4c23-a6ff-d9aecc8f221a.jpg?fit=scale-down&source=next&width=700",
"https://imagesvc.meredithcorp.io/v3/jumpstartpure/image?url=https://cf-images.us-east-1.prod.boltdns.net/v1/static/3281700261001/8169b372-ec2e-4d24-97e6-ac611b65cd67/3f93df78-58ff-4142-ad70-bd07ec3fe6b7/1280x720/match/image.jpg&w=1280&h=720&q=90&c=cc",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXme80ti-o9uH8iEiGhAgRAEQ4uD1Ccg3SIwkZ_fjQTOkAh8Zzgk4h6qZyku5gmff0UMU&usqp=CAU",
"https://www.treehugger.com/thmb/-mkq1qD-UBWiYgXiEpWwsJXB72E=/3840x2160/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1297446212-36c24576541c43e7956a67f175a9b8fa.jpg",
"https://cupe.ca/sites/cupe/files/shutterstock_295936574.jpg"]

profile_pic = ["https://static.wikia.nocookie.net/meangirls/images/0/0e/Gretchen_Wienners_3.jpg/revision/latest?cb=20160126053125",
"https://avatars.githubusercontent.com/u/72709071?v=4",
"https://avatars.githubusercontent.com/u/87001622?v=4",
"https://avatars.githubusercontent.com/u/85967924?v=4",
"https://ca.slack-edge.com/T02NE0241-U016TFXV4S2-3098e8dd7db1-512"]

user_1 = User.create(
  email: 'gretchen@google.com',
  password: 'grumble',
  username: 'Gretchen'
)
  file1 = URI.open(profile_pic[0])
  user_1.photo.attach(io: file1, filename: 'nes.jpeg', content_type: 'image/jpeg')


user_2 = User.create(
  email: 'deji@google.com',
  password: 'grumble',
  username: 'Deji'
)
  file2 = URI.open(profile_pic[1])
  user_2.photo.attach(io: file2, filename: 'nes.jpeg', content_type: 'image/jpeg')

user_3 = User.create(
  email: 'mario@google.com',
  password: 'grumble',
  username: 'Mario'
)
  file3 = URI.open(profile_pic[2])
  user_3.photo.attach(io: file3, filename: 'nes.jpeg', content_type: 'image/jpeg')

user_4 = User.create(
  email: 'cornelius@google.com',
  password: 'grumble',
  username: 'Cornelius'
)
  file4 = URI.open(profile_pic[3])
  user_4.photo.attach(io: file4, filename: 'nes.jpeg', content_type: 'image/jpeg')

user_5 = User.create(
  email: 'bruno@google.com',
  password: 'grumble',
  username: 'Bruno'
)
  file5 = URI.open(profile_pic[4])
  user_5.photo.attach(io: file5, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_1 = Island.create!(
    name: "Goblin Town",
    price: 5_000,
    location: Faker::WorldCup.team,
    squarekm: 5_000,
    number_of_villas: 3,
    guests: 40,
    wifi: true,
    helicopter: false,
    golf_course: false,
    private_chef: false,
    butlers: 1,
    yachts: 0,
    user_id: User.all.sample.id
)

    file6 = URI.open(images[0])
    island_1.photos.attach(io: file6, filename: 'nes.jpeg', content_type: 'image/jpeg')

island_2 = Island.create!(
    name: "Boujee Island",
    price: 25_000,
    location: Faker::WorldCup.team,
    squarekm: 50_000,
    number_of_villas: 10,
    guests: 200,
    wifi: true,
    helicopter: true,
    golf_course: true,
    private_chef: true,
    butlers: 20,
    yachts: 8,
    user_id: User.all.sample.id
)
    file7 = URI.open(images[1])
    island_2.photos.attach(io: file7, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_3 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 12_000,
    location: Faker::WorldCup.team,
    squarekm: 8_000,
    number_of_villas: rand(0..10),
    guests: 20,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file8 = URI.open(images[2])
    island_3.photos.attach(io: file8, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_4 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 9_000,
    location: Faker::WorldCup.team,
    squarekm: 5_000,
    number_of_villas: rand(0..10),
    guests: 30,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file9 = URI.open(images[3])
    island_4.photos.attach(io: file9, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_5 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 30_000,
    location: Faker::WorldCup.team,
    squarekm: 20_000,
    number_of_villas: 10,
    guests: 300,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file10 = URI.open(images[4])
    island_5.photos.attach(io: file10, filename: 'nes.jpeg', content_type: 'image/jpeg')

island_6 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 17_000,
    location: Faker::WorldCup.team,
    squarekm: 8_000,
    number_of_villas: rand(0..10),
    guests: 25,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file11 = URI.open(images[5])
    island_6.photos.attach(io: file11, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_7 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 21_000,
    location: Faker::WorldCup.team,
    squarekm: 16_000,
    number_of_villas: rand(0..10),
    guests: 25,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file12 = URI.open(images[6])
    island_7.photos.attach(io: file12, filename: 'nes.jpeg', content_type: 'image/jpeg')


island_8 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 15_000,
    location: Faker::WorldCup.team,
    squarekm: 6_000,
    number_of_villas: rand(0..10),
    guests: 10,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file13 = URI.open(images[7])
    island_8.photos.attach(io: file13, filename: 'nes.jpeg', content_type: 'image/jpeg')

island_9 = Island.create!(
    name: Faker::Fantasy::Tolkien.location,
    price: 9_000,
    location: Faker::WorldCup.team,
    squarekm: 6_000,
    number_of_villas: rand(0..10),
    guests: 15,
    wifi: [true, false].sample,
    helicopter: [true, false].sample,
    golf_course: [true, false].sample,
    private_chef: [true, false].sample,
    butlers: rand(0..10),
    yachts: rand(0..10),
    user_id: User.all.sample.id
)
    file14 = URI.open(images[8])
    island_9.photos.attach(io: file14, filename: 'nes.jpeg', content_type: 'image/jpeg')
