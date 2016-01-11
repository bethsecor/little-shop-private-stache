# This will guess the User class
FactoryGirl.define do
  factory :stache do
    name
    description
    price
  end

  sequence :name, ["A", "B", "C", "D", "E"].cycle do |n|
    "#{n} mustache"
  end
  sequence :description, ["A", "B", "C", "D", "E"].cycle do |n|
    "#{n} description"
  end
  sequence :price, (15..20).to_a.cycle do |n|
    n + 0.99
  end
end
