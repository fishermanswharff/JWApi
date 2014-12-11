class PostsController < ApplicationController

  before_filter :authenticate, only: :create

  def index
    @posts = Post.all.sort_by { |post| post.updated_at }.reverse
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, include: 'user,categories,images', status: :ok
  end

  def create
    @post = Post.new(post_params)
    binding.byebug

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = @user.id
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
    params.require(:post).permit(:title, :body, images: [], category_ids: [])
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