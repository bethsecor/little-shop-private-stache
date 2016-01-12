# This will guess the User class
FactoryGirl.define do
  factory :stache do
    name
    description
    price
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

end

# factory :category do
#   name "Cowboy"
#   trait :with_stache do
#     after(:create) do |category|
#       category.staches << create(:stache)
#     end
#   end
# end
#
# trait :staches do
#   ignore do
#     number_of_staches 1
#   end
#
#   after(:create) do |category, evaluator|
#     create_list(:stache, evaluator.number_of_staches, category: category)
#   end
# end
