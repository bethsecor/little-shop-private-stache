# This will guess the User class
FactoryGirl.define do
  factory :stache do
    name
    description
    price
    image_url "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg"
  end

  sequence :name, %w(A B C D E).cycle do |n|
    "#{n} mustache"
  end

  sequence :description, %w(A B C D E).cycle do |n|
    "#{n} description"
  end

  sequence :price, (15..20).to_a.cycle do |n|
    n + 0.99
  end
end
