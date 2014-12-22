require 'rails_helper'
require 'spec_helper'

describe 'Images API Endpoint' do

  before(:all) do
    Post.delete_all
    Image.delete_all
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

  end

  describe '#update' do
    
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