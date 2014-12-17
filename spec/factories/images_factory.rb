FactoryGirl.define do
  key = "uploads/#{SecureRandom.uuid}"
  factory :image do
    url "https://dubya-blog-bucket.s3.amazon.com/#{key}"
  end
end