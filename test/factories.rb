# This will guess the User class
FactoryGirl.define do  factory :user do
    username "MyString"
password_digest "MyString"
role 1
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
