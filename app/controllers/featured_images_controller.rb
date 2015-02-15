class FeaturedImagesController < ApplicationController

  def create
    @feature = FeaturedImage.create(featured_image_params)
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @post.featured_image = @feature
      render json: @post, status: :ok, location: @post
    else
      if @feature.save
        render json: @feature, status: :created, location: @feature
      else
        render json: @feature.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
  end

  private
  def featured_image_params
    params.require(:featured_image).permit(:url)
  end

end