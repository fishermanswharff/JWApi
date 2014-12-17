FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username Faker::Internet.user_name
    email Faker::Internet.email
    password_digest '$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6'
    token SecureRandom.uuid.gsub(/\-/,'')
  end
end