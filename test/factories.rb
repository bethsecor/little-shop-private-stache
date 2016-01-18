# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:password) { |n| "password#{n}" }
  end

  factory :admin, class: User do
    username "admin"
    password "pass"
    role 1
  end

  factory :order do
    user
  end

  factory :stache do
    name
    description
    price
    image_url "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg"
    after(:build) do
      |stache| stache.categories << create(:category)
    end
  end
  # factory :stache do
  #   name
  #   description
  #   price
  #   image_url "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg"
  #   transient do
  #     categories_count 2
  #     before(:build) do |stache, evaluator|
  #       create_list(:categories, evaluator.categories_count, staches: [stache])
  #     end
  #   end
  # end

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

  factory :categories do
    title
  end

  sequence :title, %w(A B C D).cycle do |n|
    "#{n} category"
  end
end
