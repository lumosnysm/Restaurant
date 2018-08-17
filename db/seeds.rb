5.times do |n|
  name = FFaker::Lorem.sentence 2
  description = FFaker::Lorem.sentence 50
  price = rand(20..100)
  Dish.create!(name: name,
    price: price,
    description: description)
end
