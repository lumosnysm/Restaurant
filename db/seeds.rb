5.times do |n|
  name = FFaker::Lorem.sentence 2
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create!(name: name,
    price: price,
    description: description)
end

User.create! name: "Admin",
  email: "admin@res.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true
