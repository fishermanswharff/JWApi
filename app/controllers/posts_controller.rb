class PostsController < ApplicationController

  before_filter :authenticate, only: :create

  def index
    @posts = Post.includes(:featured_image, :thumbnail, :images).order(updated_at: :desc)
    render json: @posts, include: ['featured_image', 'thumbnail', 'images']
  end

  def show
    post = Post.includes(:featured_image, :thumbnail, :images).find(params[:id])
    render json: post, include: ['featured_image', 'thumbnail', 'images'], status: :ok
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, images: [], categories: [])
  end

  def authenticate
    unless is_user?(get_token)
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: {
        error: 'You are not authorized!'
        }, status: 403
    end
  end

  def is_user?(token)
    @user = User.where(token: token)[0]
  end

  def get_token
    request.headers.env['HTTP_AUTHORIZATION'].gsub(/Token token=/, "")
  end

end
