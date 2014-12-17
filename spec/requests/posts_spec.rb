require 'rails_helper'
require 'spec_helper'

describe 'Posts API Enpoint' do

  before(:each) do
    Post.delete_all
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
    @posts = FactoryGirl.create_list(:post,25)
    @post = @posts.last
  end

  describe '#index' do
    it 'should send back the most recent 9 posts' do
      get "/posts"
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be 10
    end
  end

  describe '#show' do
    it 'should retreive a post by id' do
      get "/posts/#{@post.id}"
      expect(response).to be_success
      
      post_response = json(response.body)
      expect(post_response['title']).to eq @post.title
    end
  end

  describe '#create' do
    it 'should response successfully' do
      post "/posts",
        { post: 
          { title: 'Herman Mellville', body: "The Great White Whale Euismod Sit Vehicula Pellentesque Vulputate", user_id: "#{@user.id}" }
        }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => '9cbaf8c82925426c869ecfc4b610c8a6' }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#update' do
    before(:each) do

    end
    
    it 'should find the post by id' do

    end

    it 'should check for a category in the parameters' do
    end

    it 'should add a unique category to the post' do
    end

    it 'should update the parameters' do
    end
  end

  describe '#destroy' do
    it 'should find the post by id' do
    end
    it 'should destroy the post' do
    end
  end
end