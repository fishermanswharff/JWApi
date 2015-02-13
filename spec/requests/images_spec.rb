require 'rails_helper'
require 'spec_helper'

describe 'Images API Endpoint' do

  before(:all) do
    Post.delete_all
    Image.delete_all
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
    @post = FactoryGirl.create(:post)
    @images = FactoryGirl.create_list(:image,25)
    @images.map { |image| @post.images << image }
  end

  describe '#index' do
    it 'should return all of the images' do
      expect(@images.length).to eq 25
    end
  end

  describe '#create' do
    it 'should add the image to the post''s images ' do
      post "/posts/#{@post.id}/images",
        { image: 
          { url: 'https://s3.amazonaws.com/dubya-blog-bucket/uploads/eb00f33c-b80e-4e72-ada4-36bdc24f551b',
            post_id: @post.id
           }
        }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => '9cbaf8c82925426c869ecfc4b610c8a6' }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#destroy' do
    it 'should  delete the image out of the post' do
      image = @images.last
      delete "/posts/#{@post.id}/images/#{image.id}"
      expect(response.status).to eq 202
      postcontent = json(response.body)
      expect(postcontent['images'].length).to eq 24
    end
  end
end