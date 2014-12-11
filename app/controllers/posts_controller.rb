class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by { |post| post.updated_at }.reverse
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, include: 'user,categories,images', status: :ok
  end

  def create
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if post_params[:category_id]
      category = Category.find(post_params[:category_id])
      @post.categories << category
      render json: @post, status: :ok
    else
      if @post.update(post_params)
        render json: @post, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, category_ids: [])
  end

end