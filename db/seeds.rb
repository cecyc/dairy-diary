require 'faker'

category_name = ['Soft', 'Semi-soft', 'Firm', 'Blue veined', 'Fresh']

category_name.each do |name|
  Category.create(name: name)
end
