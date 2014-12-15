require 'rails_helper'
require 'spec_helper'

describe 'Categories API Endpoint' do

  before(:each) do
    User.delete_all
    @user = User.create(
      { 
        first_name: 'foo',
        last_name: 'bar',
        username: 'foo',
        role: 'generic',
        email: 'foo@bar.com',
        password: 'secret'
      }
    )
  end

  describe '#update' do
    before(:each) do
      @post = Post.create({
        title: 'My new title',
        body: 'Some text to test with',
        user_id: @user.id
      })
      @category = Category.create({name: 'Testing'})
      put "/posts/#{@post.id}/categories/#{@category.id}"
    end

    it 'should create a new category if it can''t find one' do

    end

    it 'should find the category by id' do

    end

    it 'should check to see if the category already exists in the post' do
      put "/posts/#{@post.id}/categories/#{@category.id}"
      expect(@post.categories.length).to eq 1
    end
  end
end