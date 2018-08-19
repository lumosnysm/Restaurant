User.create! name: "Admin",
  email: "admin@res.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true

10.times do |n|
  name = FFaker::Lorem.word
  Category.create! name: name
end

50.times do |n|
  name = FFaker::Lorem.sentence 1
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  id = rand(1..10)
  Dish.create! name: name,
    price: price,
    description: description,
    category_id: id
end
