User.create! name: "Admin",
  email: "admin@res.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true

20.times do |n|
  name  = "Category #{n}"
  Category.create! name: name
end

50.times do |n|
  name  = "Dish #{n}"
  price = rand(100000..1000000)
  id = rand(1..20)
  Dish.create!(name: name,
    price: price,
    category_id: id)
end
