FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraphs(3)
    # user_id Faker::Number.digit
  end
end