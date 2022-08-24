require 'faker'

Show.destroy_all
Category.destroy_all
User.destroy_all
Booking.destroy_all

# Categories seeding
categories = %w[concert théâtre dance magie spectacle\ enfant hypnose]
puts "*****Start seeding categories!!*******"
categories.each do |category|

  puts "create new category => #{category}"
  new_category = Category.new(
    name: category
  )

  puts "store it"
  new_category.save!
end
puts "*****All categories has been successfully seeded*****"

# Users seeding
puts "*****Start seeding Users*****"

10.times do
  puts "Create a new User"
  new_user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    seller: true,
    password: "secret"
  )
  new_user.save!
  puts "Store #{new_user.name}"

  puts "---Start seed Shows------"
  rand(0..3).times do
    category_id = Category.all.sample
    puts "Create a new show to #{new_user.name}"
    new_show = Show.new(
      name: Faker::Book.title,
      user_id: new_user.id,
      company: Faker::Company.name,
      category_id: category_id.id,
      description: Faker::Lorem.paragraph,
      location_center: Faker::Address.city,
      location_radius: rand(10..100),
      price: rand(50..200)
    )
    new_show.save!
    puts "Store new show => #{new_show.name}"
  end
end

puts "---Start seed Bookings------"
30.times do
  show = Show.all.sample
  user = User.all.sample
  puts "Create a new booking"
  new_booking = Booking.new(
    date: Faker::Date.between(from: '2022-08-24', to: '2022-12-31'),
    show_id: show.id,
    user_id: user.id,
    address: Faker::Address.city,
    validated: false,
  )
  new_booking.save!
end


puts "---- All shows has been successfully seeded-------"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "*****All users has been successfully seeded*******"
