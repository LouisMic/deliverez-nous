require 'faker'
User.destroy_all
Category.destroy_all
#Categories seeding
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

#Users seeding
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
end
puts "*****All users has been successfully seeded*******"
