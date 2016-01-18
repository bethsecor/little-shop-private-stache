# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:password) { |n| "password#{n}" }
  end

  factory :order do
    user
    status
    first_name
    last_name
    address
    city
    state
    zipcode
  end

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

  factory :category do
    title
  end

  sequence :title, %w(A B C D).cycle do |n|
    "#{n} category"
  end

  sequence :first_name, %w(A B C D).cycle do |n|
    "Bob#{n}"
  end

  sequence :last_name, %w(A B C D).cycle do |n|
    "Smith#{n}"
  end

  sequence :address, (1..4).to_a.cycle do |n|
    "#{n} Stache Road"
  end

  sequence :city, %w(A B C D).to_a.cycle do |n|
    "City#{n}"
  end

  sequence :state, %w(A B C D).to_a.cycle do |n|
    "Z#{n}"
  end

  sequence :zipcode, (1..4).to_a.to_a.cycle do |n|
    "8011#{n}"
  end

  sequence :status, %w(ordered paid cancelled completed).to_a.to_a.cycle do |n|
    "#{n}"
  end
end
