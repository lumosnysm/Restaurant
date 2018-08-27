User.create! name: "Admin",
  email: "admin@res.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true

Category.create! name: "fruit"
Category.create! name: "herb or spice"
Category.create! name: "meat"
Category.create! name: "vegetable"
Category.create! name: "ingredient"

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

10.times do |n|
  name = FFaker::Food.ingredient
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: 5
end

10.times do |n|
  name = FFaker::Lorem.word
  salary = rand(100..1000)
  description = FFaker::Lorem.sentence 50
  Role.create! name: name,
    salary: salary,
    description: description
end

5.times do |n|
  name = FFaker::Lorem.word
  Menu.create! name: name
end

50.times do |n|
  menu_id = rand(1..5)
  dish_id = rand(1..50)
  MenuDetail.create! menu_id: menu_id,
    dish_id: dish_id,
    category_id: Dish.find_by(id: dish_id).category_id
end

50.times do |n|
  name = FFaker::Name.name
  email = FFaker::Internet.email
  User.create! name: name,
    email: email,
    password: "111111",
    password_confirmation: "111111"
end

100.times do |n|
  user_id = rand(1..50)
  message = FFaker::Lorem.sentence 10
  time = FFaker::Time.between 1.months.ago, 1.days.ago
  people = rand(1..10)
  Order.create! time: time,
    user_id: user_id,
    status: true,
    message: message,
    people: people
end

500.times do |n|
  order_id = rand(1..50)
  dish_id = rand(1..50)
  quantity = rand(1..10)
  OrderItem.create! order_id: order_id,
    dish_id: dish_id,
    quantity: quantity,
    price_each: Dish.find_by(id: dish_id).price
end
