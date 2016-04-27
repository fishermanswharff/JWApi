require 'rails_helper'
require 'spec_helper'

describe 'Featured Image API endpoint' do

  before(:each) do
    @user = User.new(
      first_name:"Jason",
      last_name:"Wharff",
      username:"jasonwharff",
      role:"admin",
      email:"fishermanswharff@mac.com",
      password: 'secret_sauce',
      password_confirmation: 'secret_sauce',
    )
    @user.save
    @post = Post.create({
      title: 'My new title',
      body: 'Some text to test with',
      user_id: @user.id
    })
  end

  describe '#create' do
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

  describe '#update' do
    before(:each) do
      @feature = FeaturedImage.create(url: 'https://s3.amazonaws.com/dubya-blog-bucket/direct/cast-pl-site-map.jpg', post: @post)
    end
    it 'should update the featured image and return the post it belongs to' do
      put "/posts/#{@post.id}/featured_images/#{@feature.id}",
      { featured_image:
        { url: 'https://s3.amazonaws.com/dubya-blog-bucket/direct/cast-balsamiq-mockups.jpg' }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => '9cbaf8c82925426c869ecfc4b610c8a6' }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      post = json(response.body)
      expect(post['featured_image']['url']).to eq 'https://s3.amazonaws.com/dubya-blog-bucket/direct/cast-balsamiq-mockups.jpg'
    end
  end
end
