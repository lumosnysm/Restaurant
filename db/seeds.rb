User.create! name: "Admin",
  email: "admin@res.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true

Category.create! name: "fruit"
Category.create! name: "herb or spice"
Category.create! name: "meat"
Category.create! name: "vegetable"

10.times do |n|
  name = FFaker::Food.fruit
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: 1
end

10.times do |n|
  name = FFaker::Food.herb_or_spice
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: 2
end

10.times do |n|
  name = FFaker::Food.meat
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: 3
end

10.times do |n|
  name = FFaker::Food.vegetable
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: 4
end
