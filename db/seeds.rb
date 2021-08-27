require 'faker'
require "open-uri"

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

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'grumble'
  )
  user.save!
end

i = 0

9.times do
  island = Island.new(
    name: Faker::Fantasy::Tolkien.location,
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
    user_id: User.all.sample.id
  )
  file = URI.open(images[i])
  island.photos.attach(io: file, filename: 'nes.jpeg', content_type: 'image/jpeg')
  island.save!
  i += 1
end
