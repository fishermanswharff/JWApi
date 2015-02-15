require 'rails_helper'
require 'spec_helper'

describe 'Featured Image API endpoint' do

  before(:all) do
    User.delete_all
    @user = User.create({
      first_name:"Jason",
      last_name:"Wharff",
      username:"jasonwharff",
      role:"admin",
      email:"fishermanswharff@mac.com",
      password_digest:"$2a$10$qA2kdO7MOlWkAUIUQWhNtuzlIZScAs69QrTHxn13BM9i6jUUuLbfS",
      token:"9cbaf8c82925426c869ecfc4b610c8a6",
    })
    @post = Post.create({
      title: 'My new title',
      body: 'Some text to test with',
      user_id: @user.id
    })
  end

  describe '#create' do
    before(:all) do
    end

    it 'should respond successfully' do
      post "/posts/#{@post.id}/featured_images",
      { featured_image:
        { url: 'https://s3.amazonaws.com/dubya-blog-bucket/direct/cast-balsamiq-mockups.jpg' }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => '9cbaf8c82925426c869ecfc4b610c8a6' }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      post = json(response.body)
      expect(post["featured_image"]["url"]).to eq 'https://s3.amazonaws.com/dubya-blog-bucket/direct/cast-balsamiq-mockups.jpg'
    end
  end
end