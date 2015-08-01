require 'faker'

category_name = ['Soft', 'Semi-soft', 'Firm', 'Blue veined', 'Fresh']

category_name.each do |name|
  Category.create(name: name)
end

Cheese.create(name: Faker::Hacker.adjective, thoughts: Faker::Lorem.paragraph, category_id: rand(1..5))
Cheese.create(name: Faker::Hacker.adjective, thoughts: Faker::Lorem.paragraph, category_id: rand(1..5))
Cheese.create(name: Faker::Hacker.adjective, thoughts: Faker::Lorem.paragraph, category_id: rand(1..5))
Cheese.create(name: Faker::Hacker.adjective, thoughts: Faker::Lorem.paragraph, category_id: rand(1..5))
